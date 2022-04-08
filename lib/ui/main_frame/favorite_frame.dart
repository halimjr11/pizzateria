import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:pizzateria/model/local/db/pizza_database.dart';
import 'package:pizzateria/model/local/table/favorites.dart';
import 'package:pizzateria/model/pizza.dart';
import 'package:lottie/lottie.dart';
import '../detail_screen.dart';

class FavoriteFrame extends StatefulWidget {

  @override
  State<FavoriteFrame> createState() => _FavoriteFrameState();
}

class _FavoriteFrameState extends State<FavoriteFrame> {
  late List<Favorites> favorites;
  late Pizza pizza;
  bool isFavorite = false;
  bool loading = false;

  @override
  void initState(){
    refreshFavorites();
    super.initState();
  }

  @override
  void dispose() {
    PizzaDatabase.instance.close();
    super.dispose();
  }

  Future refreshFavorites() async {
    setState(() {
      loading = true;
    });
    favorites = await PizzaDatabase.instance.readAllFavorites();
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: loading ?
        const GFLoader(
          type: GFLoaderType.circle,
          size: GFSize.MEDIUM,
        ) : favorites.isEmpty ?
        Column(
          children: <Widget>[
            Lottie.asset('assets/emptyfavorite.json'),
            const Text(
              "No favorite item found!",
              style: TextStyle(
                fontSize:20.0,
                color: Colors.purpleAccent,
              ),
            ),
          ],
        ) :
        Container(
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.all(8),
          child: GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(8),
            shrinkWrap: true,
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            children: favorites.map((favorite) {
              pizza = Pizza(
                  name: favorite.name,
                  description: favorite.description,
                  deliveryTime: favorite.deliveryTime,
                  price: favorite.price,
                  imageAsset: favorite.thumbnail,
                  imageGalleries: (json.decode(favorite.images) as List<dynamic>).cast<String>()
              );
              return InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DetailScreen(pizza: pizza);
                  })).then((value) => refreshFavorites());
                },
                child: Card(
                  elevation: 20,
                  color: Colors.grey.shade600,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset(pizza.imageAsset),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: <Widget>[
                            Text(
                              pizza.name,
                              style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}