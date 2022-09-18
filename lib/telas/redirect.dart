import 'package:flutter/material.dart';


import 'package:flutter_estudo/telas/homepage.dart';


class redirect extends StatefulWidget {
  const redirect({Key? key}) : super(key: key);

  @override
  State<redirect> createState() => _redirectState();
}

class _redirectState extends State<redirect> {
  bool value = false;
  @override
  Widget _body() {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 150,
                  width: 150,
                  child: Image.asset('assets/images/counter.png'),
                ),
                SizedBox(
                  height: 80,
                ),

                SizedBox(
                  height: 10,
                ),

                SizedBox(
                  height: 15,
                ),

                Container(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/cadastrar');
                        },
                        child: Text('Cadastrar'),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/login');
                        },
                        child: Text('Fazer login'),
                      )
                    ],
                  ),
                ),
                  Container(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                           Navigator.of(context).push(MaterialPageRoute(
                                                  builder: (context) => homePage(useremail: 'Visitante@gmail.com', nome: 'Visitante',)));
                        },
                        child: Text('Visitante'),
                      )
                    ],
                  ),
                )

              
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('tela de login'),
        ),
        body: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.height,
              child: Image.asset(
                'assets/images/3d-squares-abstrato-render-android-wallpaper-whatsapp-android-iphone.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              color: Colors.white.withOpacity(0.2),
            ),
            _body(),
          ],
        ));
  }
}
