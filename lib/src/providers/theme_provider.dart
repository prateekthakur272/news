import 'package:flutter/material.dart';
import 'package:news/src/shared/themes.dart';

class ThemeProvider extends ChangeNotifier{
  bool _isDark = false;
  ThemeData _theme = themeLight;

  bool get isDark => _isDark;
  ThemeData get theme => _theme;

  void loadTheme(){

  }

  void toggleTheme(){
    _theme = _isDark?themeLight:themeDark;
    _isDark =! _isDark;
    notifyListeners();
  }
}