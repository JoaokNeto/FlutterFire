


import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter_estudo/telas/homeemp.dart';

import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class pesquisa extends StatefulWidget {
  final String? email;
  final String? nome;
  const pesquisa({Key? key, this.email, this.nome}) : super(key: key);

  @override
  State<pesquisa> createState() => _pesquisaState(email: email, nome: nome);
}

class _pesquisaState extends State<pesquisa> {
  final String? email;

  bool? value = false;
  bool? value1 = false;
  bool? value2 = false;
  bool? value3 = false;
  bool? value4 = false;
  bool? value5 = false;
  bool? value6 = false;
  bool? value7 = false;
  bool? value8 = false;
  bool? value9 = false;
  bool? value10 = false;
  _pesquisaState({Key? key, this.email, required nome});

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
  List<String> busca = [];
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
        title: Text('informações Empresa'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 75,
                    child: Text(
                      'Selceione os servios a serem filtrados',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  SizedBox(
                    height: 1,
                    width: MediaQuery.of(context).size.width,
                    child: const DecoratedBox(
                      decoration: const BoxDecoration(color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'azuleijo',
                              style: TextStyle(fontSize: 20),
                            ),
                            Checkbox(
                              value: this.value,
                              onChanged: (value) {
                                setState(() {
                                  this.value = value!;
                                });
                              },
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Pedreiro',
                              style: TextStyle(fontSize: 20),
                            ),
                            Checkbox(
                              value: this.value1,
                              onChanged: (value1) {
                                setState(() {
                                  this.value1 = value1!;
                                });
                                print(value);
                              },
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Encanador',
                              style: TextStyle(fontSize: 20),
                            ),
                            Checkbox(
                              value: this.value2,
                              onChanged: (value2) {
                                setState(() {
                                  this.value2 = value2!;
                                });
                                print(value);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                     
                        
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      

      bottomSheet: Container(
        child: Row(
          children: [
            ElevatedButton(
              onPressed: () async {
                 getInfo();
                
              },
              child: Text('Pesquisar'),
            ),
            SizedBox(
              width: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => homeemp(email: email)));
              },
              child: Text('Cancelar'),
            )
          ],
        ),
      ),
    );
  }

  Future<List<String>> getInfo() async {
    List<String> servico = [];
    List<String> resultBusca = [];

    if (value == true) servico.add('azulejista');
    if (value1 == true) servico.add('pedreiro');
    if (value2 == true) servico.add('Encanador');

    if (value1 == true || value == true || value2 == true) {
      var query = FirebaseFirestore.instance
          .collection('Empresa')
          .where('Servicos', arrayContainsAny: servico);

      var queryresult = await query.get();

      for (int i = 0; i < queryresult.size; i++) {
        resultBusca.add(queryresult.docs[i].get('nome'));
        
        
        
        

        var x = 1;
      }

      /*  Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => homeemp(email: email, nome: email,)));*/
    }

    return resultBusca;
  }

  Widget listaListview() {
    return ListView.separated(
      itemCount: busca.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(leading: Text(busca[index]));
      },
      separatorBuilder: (_, __) => const Divider(),
    );
  }
}
