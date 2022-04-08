import 'package:flutter/material.dart';
import 'package:pizzateria/ui/main_frame/favorite_frame.dart';
import 'package:pizzateria/ui/main_frame/home_frame.dart';
import 'package:pizzateria/ui/main_frame/search_frame.dart';
import 'package:pizzateria/ui/main_frame/settings_frame.dart';

class MainScreen extends StatefulWidget{

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late int _currentIndex;
  late List _appBarTitle;
  late List _children;

  @override
  void initState() {
    _currentIndex = 0;
    _appBarTitle = [
      "Pizzateria",
      "Find Pizza",
      "Favorites",
      "Settings"
    ];
    _children = [
      HomeFrame(),
      SearchFrame(),
      FavoriteFrame(),
      SettingsFrame()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints){
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            titleTextStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor
            ),
            title: Text(
                _appBarTitle[_currentIndex]
            ),
            iconTheme: Theme.of(context).iconTheme,
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: _children[_currentIndex],
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.shifting,
            selectedLabelStyle: const TextStyle(color: Colors.white70),
            selectedIconTheme: const IconThemeData(color: Colors.purple),
            unselectedIconTheme: Theme.of(context).iconTheme,
            onTap: onTabTapped,
            currentIndex: _currentIndex,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "Home"
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: "Search"
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_border),
                  label: "Favorite"
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: "Settings"
              ),
            ],
          ),
        );
      },
    );
  }
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}



