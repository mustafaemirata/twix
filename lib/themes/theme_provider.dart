import 'package:flutter/material.dart';
import 'package:twitter/themes/dark_theme.dart';
import 'package:twitter/themes/light_theme.dart';

class ThemeProvider with ChangeNotifier {
  //defaul olarak açık tema kulla

  ThemeData _themeData = lightMode;

  //temayı get ile al

  ThemeData get themeData => _themeData;

  //karanlık temada mı kontrolü
  bool get isDarkMode => _themeData == darkMode;

  //tema ayar
  set themeData(ThemeData themeData) {
    _themeData = themeData;

    //arayüz güncelle
    notifyListeners();
  }

  //temalar arası geçiş

  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}
