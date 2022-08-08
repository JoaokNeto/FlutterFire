import 'package:flutter/material.dart';
import 'package:flutter_estudo/controllers/estudoController.dart';
import 'package:flutter_estudo/cadastro/cadastrar.dart';
import 'package:flutter_estudo/telas/loginpage.dart';
import 'package:flutter_estudo/telas/redirect.dart';
import 'package:js/js.dart';
import '../telas/homepage.dart';

class widgetEstudo extends StatelessWidget {

  
    @override
    Widget build(BuildContext context) {
      return AnimatedBuilder
      (builder: (context,child) { 
       
        return MaterialApp(
        theme: ThemeData( 
        primarySwatch: Colors.blue,
        brightness: estudoController.instancia.isDartTheme 
        ? Brightness.dark
        : Brightness.light

         ),
         
       
 


      initialRoute: '/',
      routes:{
        '/': (context) =>  redirect(),
         '/home': (context) => homePage(),
         '/cadastrar': (context) => Cadastrar() ,
         '/login' : (context) => paginaLogin()     
      } 




      );
      }, animation: estudoController.instancia, 
      
      
      );
    }
  }