import 'package:flutter/material.dart';
import 'package:pizzateria/model/pizza.dart';
import 'package:pizzateria/ui/detail_screen.dart';


class SearchFrame extends StatefulWidget {

  @override
  State<SearchFrame> createState() => _SearchFrameState();
}

class _SearchFrameState extends State<SearchFrame> {
  late List<Pizza> listPizza;

  @override
  void initState(){
    super.initState();
    listPizza = pizzaList;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.black38.withAlpha(10),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                    icon: const Icon(Icons.search),
                    hintText: "Search Pizza",
                    hintStyle: TextStyle(
                      color: Colors.black.withAlpha(120),
                    ),
                    border: InputBorder.none,
                  ),
                  onChanged: (String keyword) {
                    findPizzaUsingLoop(keyword);
                  },
                ),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: listPizza.map((pizza) {
                  return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return DetailScreen(pizza: pizza);
                      }));
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
                                  height: 18,
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
        ],
      )
    );
  }

  void findPizzaUsingLoop(String pizzaName) {
      final pizzas = pizzaList.where((pizza) {
        final titleLower = pizza.name.toLowerCase();
        final searchLower = pizzaName.toLowerCase();
        return titleLower.contains(searchLower);
      }).toList();

      setState(() {
        listPizza = pizzas;
      });
  }
}