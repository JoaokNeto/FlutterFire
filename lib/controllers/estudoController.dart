import 'package:flutter/cupertino.dart';

class estudoController extends ChangeNotifier{
bool isDartTheme= false;

static estudoController instancia = estudoController();

mudarTema(){
  isDartTheme = !isDartTheme;
  notifyListeners();
}



}