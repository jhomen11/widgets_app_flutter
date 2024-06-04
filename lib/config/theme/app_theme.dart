import 'package:flutter/material.dart';

const colorList = [
  Colors.blue,
  Colors.red,
  Colors.green,
  Colors.purple,
  Colors.orange,
  Colors.yellow,
  Colors.pink,
  Colors.teal,
  Colors.cyan,
  Colors.indigo,
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0,
            'SelectedColor must be greater than or equal to 0'),
        assert(selectedColor < colorList.length,
            'SelectedColor must be less or equal than ${colorList.length - 1}');

  ThemeData getTheme() => ThemeData(
      useMaterial3: true,
      colorSchemeSeed: colorList[selectedColor],
      appBarTheme: const AppBarTheme(centerTitle: false));
}
