import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';
part 'teste.g.dart';

class Counter = _Counter with _$Counter;

abstract class _Counter with Store {
  @observable
  String name = '';



  @observable
  String telefone = '';

  @observable
  String cidade = '';

  @observable
  String estado = '';

  @action

  Future getInfoPessoal(String? email) async {
    var query = FirebaseFirestore.instance.collection('Empresa').doc(email);
    var queryresult = await query.get();
    name = await queryresult.get('nome');
    telefone = await queryresult.get('telefone');
    cidade = await queryresult.get('cidade');
    estado = await queryresult.get('estado');
  }
}
