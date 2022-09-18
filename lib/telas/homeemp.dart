//import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_cidades/app/widgets/dropdown_cidades.widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_estudo/controllers/estudoController.dart';
import 'package:flutter_estudo/telas/perfil.dart';

class homeemp extends StatefulWidget {
  final String? email;
  final String? nome;
  const homeemp({Key? key, this.email, this.nome}) : super(key: key);

  @override
  State<homeemp> createState() => _homeempState(email: email, nome: nome);
}

class _homeempState extends State<homeemp> {
  final String? email;

  var nome;
  String? valueCidadeout;
  String? valueEstadoout;
  bool? value = false;
  bool? value1 = false;
  bool? value2 = false;
  bool? value3 = false;
  Map<String, dynamic> listaEmp = {};

  Map<String, dynamic> listaEmpAux = {};
  int? listTam = 0;

  _homeempState({Key? key, this.email, this.nome});

  FirebaseAuth auth = FirebaseAuth.instance;
  int counter = 0;
  bool isDartTheme = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        actions: [switchEstudo()],
        title: Text(
          'Filtre os serviços desejados emp',
          style: TextStyle(fontSize: 25.0),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(''),
              accountEmail: Text('$email'),
            ),
            // ListTile(
            //   title: Text('Serviços prestados por mim'),
            //   onTap: () {
            //     getInfoPessoal();
            //     // showDialog<void>(
            //     //   context: context,
            //     //   barrierDismissible: false, // user must tap button!
            //     //   builder: (BuildContext context) {
            //     //     return AlertDialog(
            //     //       title: const Text('ATENÇÃO'),
            //     //       content: SingleChildScrollView(
            //     //         child: ListBody(
            //     //           children: <Widget>[
            //     //             Text('Senha incorreta'),
            //     //           ],
            //     //         ),
            //     //       ),
            //     //       actions: <Widget>[
            //     //         TextButton(
            //     //           child: const Text('OK'),
            //     //           onPressed: () {
            //     //             Navigator.of(context).pop();
            //     //           },
            //     //         ),
            //     //       ],
            //     //     );
            //     //   },
            //     // );
            //   },
            // ),
          ],
        ),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                      itemCount: listTam,
                      itemBuilder: (BuildContext context, int index) {
                        String Key = listaEmp.keys.elementAt(index);
                        if (listTam == 0) {
                          return ListTile(title: Text(" "));
                        } else {
                          return ListTile(
                            leading: const Icon(Icons.assignment_ind),
                            title: Text("${listaEmp[Key]}"),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => perfil(email: Key)));
                            },
                          );
                        }
                      }),
                )
                // switchEstudo(),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Container(
        child: Row(
          children: [
            ElevatedButton(
              onPressed: () async {
                await showDialog<void>(
                  barrierDismissible: false,
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: SingleChildScrollView(
                        child: StatefulBuilder(
                          builder:
                              (BuildContext context, StateSetter setState) {
                            return Column(
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
                                      value: this.value3,
                                      onChanged: (value3) {
                                        setState(() {
                                          this.value3 = value3!;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 50,
                                      width: 275,
                                      child: DropdownCidades(
                                        widthDropdownState: 100,
                                        widthDropdownCity: 130,
                                        onChangedCity: (valueCidade) {
                                          valueCidadeout = valueCidade;
                                          print(
                                              'A cidade selecionada é: $valueCidade');
                                        },
                                        onChangedState: (valueEstado) {
                                          valueEstadoout = valueEstado;
                                          print(
                                              'O Estado selecionada é: $valueEstado');
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('OK'),
                          onPressed: () async {
                            if (value1 == true ||
                                value == true ||
                                value2 == true ||
                                value3 == true ||
                                valueCidadeout != null ||
                                valueEstadoout != null) {
                              listaEmpAux = await getInfo();

                              setState(() {
                                listaEmp = listaEmpAux;
                                listTam = listaEmp.length;
                              });
                              Navigator.of(context).pop();
                            } else {
                              Navigator.of(context).pop();
                            }
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Selecionar serviços'),
            )
          ],
        ),
      ),
    );
  }

  Future<Map<String, dynamic>> getInfo() async {
    List<String> servico = [];
    List<String> resultBusca = [];
    Map<String, dynamic> servicos = {};

    if (value == true) servico.add('azulejista');
    if (value1 == true) servico.add('pedreiro');
    if (value2 == true) servico.add('Encanador');
    if (value3 == true) servico.add('eletricista residencial');

    if (value1 == true ||
        value == true ||
        value2 == true ||
        value3 == true ||
        valueCidadeout != null ||
        valueEstadoout != null) {
      if (servico.isEmpty) {
        var query = FirebaseFirestore.instance
            .collection('Empresa')
            .where('cidade', isEqualTo: valueCidadeout)
            .where('estado', isEqualTo: valueEstadoout);
        var queryresult = await query.get();
        valueCidadeout = '';
        valueEstadoout = '';
        for (int i = 0; i < queryresult.size; i++) {
          var name = queryresult.docs[i].get('nome');
          var email = queryresult.docs[i].get('Email');

          servicos.addAll({email: name});
          print(servicos);

          resultBusca.add(queryresult.docs[i].get('nome'));
        }
      } else if (valueEstadoout == '') {
        var query = FirebaseFirestore.instance
            .collection('Empresa')
            .where('Servicos', arrayContainsAny: servico);
        var queryresult = await query.get();
        valueCidadeout = '';
        valueEstadoout = '';

        for (int i = 0; i < queryresult.size; i++) {
          var name = queryresult.docs[i].get('nome');
          var email = queryresult.docs[i].get('Email');

          servicos.addAll({email: name});
          print(servicos);

          resultBusca.add(queryresult.docs[i].get('nome'));
        }
      } else {
        var query = FirebaseFirestore.instance
            .collection('Empresa')
            .where('Servicos', arrayContainsAny: servico)
            .where('cidade', isEqualTo: valueCidadeout)
            .where('estado', isEqualTo: valueEstadoout);
        ;
        var queryresult = await query.get();
        valueCidadeout = '';
        valueEstadoout = '';

        for (int i = 0; i < queryresult.size; i++) {
          var name = queryresult.docs[i].get('nome');
          var email = queryresult.docs[i].get('Email');

          servicos.addAll({email: name});
          print(servicos);

          resultBusca.add(queryresult.docs[i].get('nome'));
        }
      }

      // var query = FirebaseFirestore.instance
      //     .collection('Empresa')
      //     .where('Servicos', arrayContainsAny: servico)
      //     .where('cidade', isEqualTo: valueCidadeout)
      //     .where('estado', isEqualTo: valueEstadoout);

    }

    return servicos;
  }

  Future<List<String>> getInfoPessoal() async {
    List<String> servico = [];
    List<String> resultBusca = [];
    List<String> servicos = [];

    var query = FirebaseFirestore.instance.collection('Empresa').doc(email);

    var queryresult = await query.get();

    resultBusca.add(queryresult.get('Servicos'));

    var x = 1;

    return resultBusca;
  }
}

class switchEstudo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: estudoController.instancia.isDartTheme,
      onChanged: (value) {
        estudoController.instancia.mudarTema();
      },
    );
  }
}
