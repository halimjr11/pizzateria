import 'package:flutter/material.dart';
import 'package:pizzateria/widget/change_theme_switch_widget.dart';

class SettingsFrame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ChangeThemeSwitchWidget(),
        ],
      ),
    );
  }

}