import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_estudo/telas/homeemp.dart';
import 'package:flutter_estudo/telas/homepage.dart';


class paginaLogin extends StatefulWidget {
  final String? email;
  const paginaLogin({Key? key, this.email}) : super(key: key);

  @override
  State<paginaLogin> createState() => _paginaLoginState();
}

class _paginaLoginState extends State<paginaLogin> {
  late String? email;
  _paginaLoginState({Key? key, this.email});

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
                TextField(
                    decoration: InputDecoration(
                        labelText: 'Email', border: OutlineInputBorder()),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: ((value) {
                      setState(() {
                        _email = value.trim();
                        email = value.trim();
                      });
                    })),
                SizedBox(
                  height: 10,
                ),
                TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: 'Senha', border: OutlineInputBorder()),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: ((value) {
                      setState(() {
                        _password = value.trim();
                      });
                    })),
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
      UserCredential credential = await autenticacao.signInWithEmailAndPassword(
          email: _email, password: _password);

      var collection = FirebaseFirestore.instance.collection('Empresa');

      var query = FirebaseFirestore.instance
          .collection('Empresa')
          .where('Email', isEqualTo:  email);

      var queryresult = await query.get();

      var result = await collection.get();
      List<String> aux = [];
      for (var doc in result.docs) {
        aux.add(doc['Email']);
      }
/*
      List<String> Listafiltrada = [];
      List<String> Lista = [];
      List<String> filtroSelecionado = [];

      filtroSelecionado.add('azulejo');
      filtroSelecionado.add('outra coisa');


      for (var i = 0; i < Lista.length; i++) {
        if (filtroSelecionado.contains(Lista.elementAt(i))) {
          Listafiltrada.add(Lista.elementAt(i));
        }
      }
*/
      if (aux.contains(email) == true) {
        var aux = queryresult.docs[0].get("nome");
        String nome = "";
        nome = aux;
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => homeemp(email: email, nome: nome)));
      } else {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => homePage(useremail: email)));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showDialog<void>(
          context: context,
          barrierDismissible: false, // user must tap button!
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('ATENÇÃO'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text('Email inválido'),
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
      } else if (e.code == 'wrong-password') {
        showDialog<void>(
          context: context,
          barrierDismissible: false, // user must tap button!
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('ATENÇÃO'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text('Senha incorreta'),
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
}
