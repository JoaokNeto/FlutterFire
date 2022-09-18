import 'package:flutter/cupertino.dart';
import 'package:js/js.dart';

class estudoController extends ChangeNotifier {
  bool isDartTheme = false;

  static estudoController instancia = estudoController();

  mudarTema() {
    isDartTheme = !isDartTheme;
    notifyListeners();
  }
}
