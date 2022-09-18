
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_estudo/telas/informacoes.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';


class Cadastrar extends StatefulWidget {
  const Cadastrar({Key? key}) : super(key: key);

  @override
  State<Cadastrar> createState() => _CadastrarState();
}

class _CadastrarState extends State<Cadastrar> {
  String _email = "";
  String _password = "";
  final auth = FirebaseAuth.instance;
  TextEditingController telefone = TextEditingController();
  TextEditingController cpfcnpj = TextEditingController();

  //mascara para telefone
  var maskFormatter = new MaskTextInputFormatter(
      mask: '+## (##) #####-####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  var maskFormatterdataNasc = new MaskTextInputFormatter(
      mask: '##/##/####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('tela de Cadastro'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('O Cadastro para solicitante é opcional ',
                  style: TextStyle(
                    color: Colors.green
                  ),),
                  
                  TextField(
                      decoration: InputDecoration(
                          labelText: 'Email', border: OutlineInputBorder()),
                      keyboardType: TextInputType.emailAddress,
                      onChanged: ((value) {
                        setState(() {
                          _email = value.trim();
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
                          cadastrar();
                        },
                        child: Text('Cadastrar'),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed('/');
                        },
                        child: Text('Cancelar'),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> cadastrar() async {
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
      UserCredential credential = await autenticacao
          .createUserWithEmailAndPassword(email: _email, password: _password);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => informacao(email: _email)));

      /*user = credential.user;
      await user!.updateDisplayName(nome.text);
      await user.reload();
      user.sendEmailVerification();*/
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showDialog<void>(
          context: context,
          barrierDismissible: false, // user must tap button!
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('ATENÇÃO'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text('Senha Muito Fraca'),
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
      } else if (e.code == 'email-already-in-use') {
        showDialog<void>(
          context: context,
          barrierDismissible: false, // user must tap button!
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('ATENÇÃO'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text('Email em uso'),
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
