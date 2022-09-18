// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teste.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Counter on _Counter, Store {
  late final _$nameAtom = Atom(name: '_Counter.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$telefoneAtom = Atom(name: '_Counter.telefone', context: context);

  @override
  String get telefone {
    _$telefoneAtom.reportRead();
    return super.telefone;
  }

  @override
  set telefone(String value) {
    _$telefoneAtom.reportWrite(value, super.telefone, () {
      super.telefone = value;
    });
  }

  late final _$cidadeAtom = Atom(name: '_Counter.cidade', context: context);

  @override
  String get cidade {
    _$cidadeAtom.reportRead();
    return super.cidade;
  }

  @override
  set cidade(String value) {
    _$cidadeAtom.reportWrite(value, super.cidade, () {
      super.cidade = value;
    });
  }

  late final _$estadoAtom = Atom(name: '_Counter.estado', context: context);

  @override
  String get estado {
    _$estadoAtom.reportRead();
    return super.estado;
  }

  @override
  set estado(String value) {
    _$estadoAtom.reportWrite(value, super.estado, () {
      super.estado = value;
    });
  }

  late final _$getInfoPessoalAsyncAction =
      AsyncAction('_Counter.getInfoPessoal', context: context);

  @override
  Future<dynamic> getInfoPessoal(String? email) {
    return _$getInfoPessoalAsyncAction.run(() => super.getInfoPessoal(email));
  }

  @override
  String toString() {
    return '''
name: ${name},
telefone: ${telefone},
cidade: ${cidade},
estado: ${estado}
    ''';
  }
}
