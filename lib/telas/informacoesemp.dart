


import 'package:dropdown_cidades/app/widgets/dropdown_cidades.widget.dart';

import 'package:flutter/cupertino.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter_estudo/telas/homeemp.dart';
import 'package:flutter_estudo/telas/redirect.dart';

import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class informacaoemp extends StatefulWidget {
  final String? email;
  final String? nome;
  const informacaoemp({Key? key, this.email, this.nome}) : super(key: key);

  @override
  State<informacaoemp> createState() =>
      _informacaoempState(email: email, nome: nome);
}

class _informacaoempState extends State<informacaoemp> {
  final String? email;

  String? valueCidadeout;
  String? valueEstadoout;

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
  _informacaoempState({Key? key, this.email, required nome});

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
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Column(
                          children: [
                            SizedBox(
                              child: Text(
                                'Selecione sua cidade e Estado:',
                                style: TextStyle(fontSize: 25),
                              ),
                            ),
                            SizedBox(
                              height: 1,
                              width: MediaQuery.of(context).size.width,
                              child: const DecoratedBox(
                                decoration:
                                    const BoxDecoration(color: Colors.black),
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  child: SizedBox(
                                    width: 410,
                                    height: 50,
                                    child: DropdownCidades(
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
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 20,
                        height: 20,
                      ),
                      SizedBox(
                        height: 1,
                        width: MediaQuery.of(context).size.width,
                        child: const DecoratedBox(
                          decoration: const BoxDecoration(color: Colors.lightBlue),
                        ),
                      ),
                      SizedBox(
                        height: 75,
                        child: Text(
                          'Marque aqui o serviços prestados pela sua empresa:',
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                      SizedBox(
                        height: 1,
                        width: MediaQuery.of(context).size.width,
                        child: const DecoratedBox(
                          decoration: const BoxDecoration(color: Colors.lightBlue),
                        ),
                      ),
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
                            ' Pedreiro',
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
                            ' Encanador',
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
                      Row(
                        children: [
                          Text(
                            'Eletricista Residencial',
                            style: TextStyle(fontSize: 20),
                          ),
                          Checkbox(
                            value: this.value3,
                            onChanged: (value3) {
                              setState(() {
                                this.value3 = value3!;
                              });
                              print(value);
                            },
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Eletricista Residencial',
                            style: TextStyle(fontSize: 20),
                          ),
                          Checkbox(
                            value: this.value3,
                            onChanged: (value3) {
                              setState(() {
                                this.value3 = value3!;
                              });
                              print(value);
                            },
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Eletricista Residencial',
                            style: TextStyle(fontSize: 20),
                          ),
                          Checkbox(
                            value: this.value3,
                            onChanged: (value3) {
                              setState(() {
                                this.value3 = value3!;
                              });
                              print(value);
                            },
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Eletricista Residencial',
                            style: TextStyle(fontSize: 20),
                          ),
                          Checkbox(
                            value: this.value3,
                            onChanged: (value3) {
                              setState(() {
                                this.value3 = value3!;
                              });
                              print(value);
                            },
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Eletricista Residencial',
                            style: TextStyle(fontSize: 20),
                          ),
                          Checkbox(
                            value: this.value3,
                            onChanged: (value3) {
                              setState(() {
                                this.value3 = value3!;
                              });
                              print(value);
                            },
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Eletricista Residencial',
                            style: TextStyle(fontSize: 20),
                          ),
                          Checkbox(
                            value: this.value3,
                            onChanged: (value3) {
                              setState(() {
                                this.value3 = value3!;
                              });
                              print(value);
                            },
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Eletricista Residencial',
                            style: TextStyle(fontSize: 20),
                          ),
                          Checkbox(
                            value: this.value3,
                            onChanged: (value3) {
                              setState(() {
                                this.value3 = value3!;
                              });
                              print(value);
                            },
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Eletricista Residencial',
                            style: TextStyle(fontSize: 20),
                          ),
                          Checkbox(
                            value: this.value3,
                            onChanged: (value3) {
                              setState(() {
                                this.value3 = value3!;
                              });
                              print(value);
                            },
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Eletricista Residencial',
                            style: TextStyle(fontSize: 20),
                          ),
                          Checkbox(
                            value: this.value3,
                            onChanged: (value3) {
                              setState(() {
                                this.value3 = value3!;
                              });
                              print(value);
                            },
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Eletricista Residencial',
                            style: TextStyle(fontSize: 20),
                          ),
                          Checkbox(
                            value: this.value3,
                            onChanged: (value3) {
                              setState(() {
                                this.value3 = value3!;
                              });
                              print(value);
                            },
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Eletricista Residencial',
                            style: TextStyle(fontSize: 20),
                          ),
                          Checkbox(
                            value: this.value3,
                            onChanged: (value3) {
                              setState(() {
                                this.value3 = value3!;
                              });
                              print(value);
                            },
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Eletricista Residencial',
                            style: TextStyle(fontSize: 20),
                          ),
                          Checkbox(
                            value: this.value3,
                            onChanged: (value3) {
                              setState(() {
                                this.value3 = value3!;
                              });
                              print(value);
                            },
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Eletricista Residencial',
                            style: TextStyle(fontSize: 20),
                          ),
                          Checkbox(
                            value: this.value3,
                            onChanged: (value3) {
                              setState(() {
                                this.value3 = value3!;
                              });
                              print(value);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      bottomSheet: Row(
        children: [
          Row(
            children: [
              IconButton(
                icon: Icon(CupertinoIcons.arrow_right_circle_fill),
                iconSize: 60,
                color: Colors.lightBlue,
                onPressed: () {
                  _configurandoModalBottomSheet(context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  sendInfo() {
    Map<String, List<String>> servicos = {'Servicos': items};
    List<String> servico = [];

    if (value == true) servico.add('azulejista');
    if (value1 == true) servico.add('pedreiro');
    if (value2 == true) servico.add('Encanador');
    if (value3 == true) servico.add('eletricista residencial');

    if (value1 == true ||
        value == true ||
        value2 == true ||
        value3 == true ||
        valueCidadeout != "" ||
        valueEstadoout != "") {
      servicos.update('Servicos', (value) => servico);

      FirebaseFirestore.instance.collection('Empresa').doc('$email').update(
            servicos,
          );

      FirebaseFirestore.instance.collection('Empresa').doc('$email').update({
        'cidade': valueCidadeout,
        'estado': valueEstadoout,
      });

      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => homeemp(
                email: email,
                
              )));
    }
  }

  void _configurandoModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: new Icon(
                      CupertinoIcons.arrow_right_circle_fill,
                      color: Colors.lightBlue,
                    ),
                    title: new Text('Prosseguir'),
                    onTap: () => {
                          sendInfo(),
                        }),
                ListTile(
                  leading: new Icon(
                    Icons.cancel,
                    color: Colors.lightBlue,
                  ),
                  title: new Text('Cancelar'),
                  onTap: () => {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => redirect()))
                  },
                ),
                ListTile(
                  leading: new Icon(
                    CupertinoIcons.info_circle_fill,
                    color: Colors.lightBlue,
                  ),
                  title: new Text(
                      'Sugetão de profissões? entre em contato: joaokleberaneto@gmail.com'),
                  onTap: () => {},
                ),
              ],
            ),
          );
        });
  }
}
