import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pizzateria/provider/theme_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangeThemeSwitchWidget extends StatefulWidget {
  @override
  State<ChangeThemeSwitchWidget> createState() => _ChangeThemeSwitchWidgetState();
}

class _ChangeThemeSwitchWidgetState extends State<ChangeThemeSwitchWidget> {
  bool isSwitched = false;
  static const themeState = "theme_state";

  @override
  void initState() {
    super.initState();
    getStateTheme();
  }

  Future setDarkMode(bool state) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(themeState, state);
  }

  Future getStateTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isSwitched = prefs.getBool(themeState)!;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Card(
      elevation: 20,
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          const Expanded(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Text('Dark Mode'),
            ),
          ),
          const SizedBox(
            width: 200,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Switch(
                value: isSwitched,
                onChanged: (value) {
                  setState(() {
                    setDarkMode(value);
                    themeProvider.toggleTheme(value);
                    getStateTheme();
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}