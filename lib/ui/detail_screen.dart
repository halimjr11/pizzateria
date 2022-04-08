import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pizzateria/model/local/db/pizza_database.dart';
import 'package:pizzateria/model/local/table/favorites.dart';
import 'package:pizzateria/model/pizza.dart';
import 'package:pizzateria/ui/main_screen.dart';

class DetailScreen extends StatefulWidget {
  final Pizza pizza;
  const DetailScreen({Key? key, required this.pizza}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Pizza pizza;
  bool isFavorite = false;
  late Favorites favorites;
  num quantity = 1;
  int selectedImage = 0;



  @override
  void initState() {
    super.initState();
    pizza = widget.pizza;
    checkFavorite(pizza.name);
    favorites = Favorites(
        name: pizza.name,
        description: pizza.description,
        deliveryTime: pizza.deliveryTime,
        price: pizza.price,
        thumbnail: pizza.imageAsset,
        images: json.encode(pizza.imageGalleries)
    );
  }

  Future checkFavorite(String name) async {
    isFavorite = await PizzaDatabase.instance.isAdded(name);
    setState(() {
      isFavorite = isFavorite;
    });
  }


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints){
          return Scaffold(
            backgroundColor: Colors.purple.shade100,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              iconTheme: Theme.of(context).iconTheme,
              title: const Text("Detail"),
              leading: IconButton(
                  color: Theme.of(context).iconTheme.color,
                  onPressed: (){
                    Navigator.pop(context, MaterialPageRoute(builder: (context) {
                      setState(() {
                        checkFavorite(pizza.name);
                      });
                      return MainScreen();
                    }));
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 25,
                  ),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    width: 280,
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Image.asset(pizza.imageGalleries[selectedImage]),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...List.generate(
                          pizza.imageGalleries.length,
                              (index){
                                return GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      selectedImage = index;
                                    });
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 8, left: 8),
                                    padding: const EdgeInsets.all(8),
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.purpleAccent.shade100,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: selectedImage == index ? Colors.purple.shade800 : Colors.transparent)
                                    ),
                                    child: Image.asset(pizza.imageGalleries[index]),
                                  ),
                                );
                              }
                      )
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    padding: const EdgeInsets.only(top: 16),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor,
                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children:  [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Text(
                              pizza.name,
                              style: Theme.of(context).textTheme.headline5,
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            margin: const EdgeInsets.only(right: 20),
                            width: 70,
                            decoration: BoxDecoration(
                              color: Colors.pink.shade200,
                              borderRadius: const BorderRadius.all(Radius.circular(30)),
                            ),
                            child: IconButton(
                              icon: Icon(
                                  Icons.favorite,
                                  color: isFavorite ? Colors.red : Colors.grey.shade400,
                                  size: 35,
                              ),
                              onPressed: () {
                                if(isFavorite){
                                  PizzaDatabase.instance.delete(pizza.name);
                                } else {
                                  PizzaDatabase.instance.create(favorites);
                                }
                                setState(() {
                                  checkFavorite(pizza.name);
                                });
                              }
                            ),
                          ),
                        ),
                        Container(
                            margin: const EdgeInsets.only(top: 16),
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Text(
                                pizza.description,
                                style: Theme.of(context).textTheme.bodyText2,
                            )
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 20,left: 20, top: 16, bottom: 25),
                              child: const Text(
                                "Delivery Time",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                                margin: const EdgeInsets.only(right: 25, top: 16, bottom: 25),
                                child: Text(
                                    pizza.deliveryTime,
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                )
                            ),
                            Container(
                                margin: const EdgeInsets.only(top: 16, bottom: 25, right: 20),
                                child: Text(
                                  pizza.price,
                                  style: const TextStyle(
                                      fontSize:16,
                                      fontWeight: FontWeight.bold
                                  ),
                                )
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
}