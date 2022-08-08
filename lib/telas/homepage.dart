import 'package:flutter/material.dart';
import 'package:flutter_estudo/controllers/estudoController.dart';
import 'package:flutter_estudo/telas/loginpage.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  int counter = 0;
  bool isDartTheme = false;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        actions: [switchEstudo()],
        title: Text('barra homePage', style: TextStyle(fontSize: 35.0),),
      ),

     drawer: Drawer(
      child: ListView(
       padding: EdgeInsets.zero,
       children: [
       UserAccountsDrawerHeader(
         accountName: Text('Joao Kleber'), 
        accountEmail: Text('joaokleberaneto@gmail.com'),
      
       )

       ],

      ),



     ),

      body: 
      Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
             children:[
            Text(
              'contador: $counter',
               style: TextStyle(fontSize: 50.0),
            ), 
            
           // switchEstudo(), 
            ],     
          ),

        ),
      ),
      
      
      

      
      floatingActionButton: SpeedDial(
       animatedIcon: AnimatedIcons.menu_close,
       children: [
        SpeedDialChild(
          child: Icon(Icons.menu_open),
          label: 'adicionar',
            onTap: () { 
       setState(() {
         counter++;
       }); 
      },
        ),
        SpeedDialChild(
          child: Icon(Icons.menu_open),
          label: 'remover',
            onTap: () { 
       setState(() {
         counter--;
       }); 
      },
        ),
        
        


       ],
     
     
    )
    
    );
  }
}



class switchEstudo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Switch(
           value: estudoController.instancia.isDartTheme, 
           onChanged: (value){
          estudoController.instancia.mudarTema();
           },
      );
  }
}