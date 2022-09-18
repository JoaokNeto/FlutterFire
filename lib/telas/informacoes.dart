

import 'package:dropdown_button2/dropdown_button2.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

import 'package:flutter_estudo/telas/homepage.dart';
import 'package:flutter_estudo/telas/informacoesemp.dart';

import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class informacao extends StatefulWidget {
  final String? email;
  const informacao({Key? key, this.email}) : super(key: key);

  @override
  State<informacao> createState() => _informacaoState(email: email);
}

class _informacaoState extends State<informacao> {
  final String? email;
  _informacaoState({Key? key, this.email});

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
        title: Text('informações complementares'),
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
                  TextField(
                    controller: controllertnome,
                    decoration: InputDecoration(
                        labelText: 'Nome', border: OutlineInputBorder()),
                    keyboardType: TextInputType.name,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: controllertelefone,
                    inputFormatters: [maskFormatter],
                    decoration: InputDecoration(
                        labelText: 'telefone', border: OutlineInputBorder()),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: controllertcpfcnpj,
                    decoration: InputDecoration(
                        labelText: 'CNPJ/CPF', border: OutlineInputBorder()),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  DropdownButtonHideUnderline(
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: DropdownButton2(
                        isExpanded: true,
                        hint: Row(
                          children: const [
                            Icon(
                              Icons.list,
                              size: 16,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Expanded(
                              child: Text(
                                'Tipo',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        items: items
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ))
                            .toList(),
                        value: selectedValue,
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value as String;
                          });
                        },
                        icon: const Icon(
                          Icons.arrow_forward_ios_outlined,
                        ),
                        iconSize: 14,
                        iconEnabledColor: Colors.white,
                        iconDisabledColor: Colors.grey,
                        buttonHeight: 50,
                        buttonWidth: 160,
                        buttonPadding:
                            const EdgeInsets.only(left: 14, right: 14),
                        buttonDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: Colors.black26,
                          ),
                          color: Colors.blue,
                        ),
                        buttonElevation: 2,
                        itemHeight: 40,
                        itemPadding: const EdgeInsets.only(left: 14, right: 14),
                        dropdownMaxHeight: 200,
                        dropdownWidth: 200,
                        dropdownPadding: null,
                        dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.blue,
                        ),
                        dropdownElevation: 8,
                        scrollbarRadius: const Radius.circular(40),
                        scrollbarThickness: 6,
                        scrollbarAlwaysShow: true,
                        offset: const Offset(-20, 0),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                        
                          sendInfo();
                        },
                        child: Text('Prosseguir'),
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

  sendInfo() {
    final nome = controllertnome.text;
    final telefone = controllertelefone.text;
    final cpfcnpj = controllertcpfcnpj.text;
    final valuetipo = selectedValue;

    createUserEmp(
        cpfcnpj: cpfcnpj,
        email: email,
        telefone: telefone,
        valuetipo: selectedValue,
        nome : nome );
  }

  Future createUserEmp({
    required cpfcnpj,
    telefone,
    email,
    valuetipo,
    nome,
  }) async {
    final infoUser =
        FirebaseFirestore.instance.collection('$valuetipo/').doc('$email');
    final json = {'Email' : email,'nome':nome ,'cpfcnpj': cpfcnpj, 'telefone': telefone, 'Tipo': valuetipo};

    await infoUser.set(json);
    if( valuetipo == "Empresa"){
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => informacaoemp(email: email, nome : nome)));
    } else

    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => homePage(useremail: email)));

  }
}
