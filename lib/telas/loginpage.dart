import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_estudo/cadastro/cadastrar.dart';
import 'package:flutter_estudo/telas/homepage.dart';
import 'package:js/js.dart';
import 'package:provider/provider.dart';

class paginaLogin extends StatefulWidget {
  const paginaLogin({Key? key}) : super(key: key);

  @override
  State<paginaLogin> createState() => _paginaLoginState();
}

class _paginaLoginState extends State<paginaLogin> {
  
   
  late String _email, _password;
  final auth = FirebaseAuth.instance;


  Widget _body() {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            
            child: 
            Column(
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
                TextField(
                  decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder()),
                 keyboardType: TextInputType.emailAddress,
                 onChanged: ((value) {
                   setState(() {
                     _email = value.trim();
                   });  
                 }
                )
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: 'Senha', 
                      border: OutlineInputBorder()),
                      keyboardType: TextInputType.emailAddress,
                   onChanged: ((value) {
                   setState(() {
                     _password = value.trim();
                   });  
                 }
                )    

                ),
                SizedBox(
                  height: 15,
                ),
            
               
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                       Logar();
                      },
                      child: Text('Login'),
                    ),
            
                   
                  ],
                ),
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
              width:  MediaQuery.of(context).size.height,
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

//************************************ */


  Future<void> Logar() async {
    if (_email == "" || _password == "") {
      showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('ATENÇÃO'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('Preencha todos os dados'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      return;
    }
    User? user;
    try {
      FirebaseAuth autenticacao = FirebaseAuth.instance;
      UserCredential credential =
          await autenticacao.signInWithEmailAndPassword(email: _email, password: _password);
          Navigator.of(context).pushNamed('/home'); 
      /*user = credential.user;
      await user!.updateDisplayName(nome.text);
      await user.reload();
      user.sendEmailVerification();*/

    } catch (e) {
      showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('ATENÇÃO'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('Verifique os dados inseridos'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }





}


