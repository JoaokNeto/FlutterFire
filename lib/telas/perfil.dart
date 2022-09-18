import 'package:flutter_estudo/stores/teste.dart';

import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class perfil extends StatefulWidget {
  final String? email;
  const perfil({Key? key, this.email}) : super(key: key);

  @override
  State<perfil> createState() => _perfilState(email: email);
}

class _perfilState extends State<perfil> {
  final counter = Counter();

  @override
  final String? email;
  _perfilState({Key? key, this.email});

  final List<String> items = [
    'Empresa',
    'Solicitante',
  ];
  String? selectedValue;

  //late String telefone, cpfcnpj;
  final bool emp = false;
  final controllertelefone = TextEditingController();
  final controllertcpfcnpj = TextEditingController();
  final controllertnome = TextEditingController();

  //mascara para telefone
  var maskFormatter = new MaskTextInputFormatter(
      mask: '+## (##) #####-####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  var maskFormatterdataNasc = new MaskTextInputFormatter(
      mask: '##/##/####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);
  Map<String, dynamic> documento = {};

  @override
  void initState() {
    counter.getInfoPessoal(this.email);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[100],
      appBar: AppBar(
        title: Text('Tela De Perfil implementação futura'),
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
                  Container(
                    height: 25,
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(left: 9),
                    padding: const EdgeInsets.all(3.0),
                    child: Text(
                      'Nome:',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 42,
                    margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent)),
                    child: Observer(
                      builder: ((context) {
                        return Text(counter.name);
                      }),
                    ),
                  ),
                  Container(
                    height: 25,
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(left: 9),
                    padding: const EdgeInsets.all(3.0),
                    child: Text(
                      'Telefone:',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 42,
                    margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent)),
                    child: Observer(
                      builder: ((context) {
                        return Text(counter.telefone);
                      }),
                    ),
                  ),
                  Container(
                    height: 25,
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(left: 9),
                    padding: const EdgeInsets.all(3.0),
                    child: Text(
                      'Cidade:',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 42,
                    margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent)),
                    child: Observer(
                      builder: ((context) {
                        return Text(counter.cidade);
                      }),
                    ),
                  ),
                  Container(
                    height: 25,
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(left: 9),
                    padding: const EdgeInsets.all(3.0),
                    child: Text(
                      'Estado:',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 42,
                    margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent)),
                    child: Observer(
                      builder: ((context) {
                        return Text(counter.estado);
                      }),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          // setState(() async {
                          //   await getInfoPessoal();
                          // });
                        },
                        child: Text('Visualizar Informções'),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Voltar'),
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
}
