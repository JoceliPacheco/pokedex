// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on HomeControllerBase, Store {
  final _$listaPokemonAtom = Atom(name: 'HomeControllerBase.listaPokemon');

  @override
  List<Pokemon> get listaPokemon {
    _$listaPokemonAtom.reportRead();
    return super.listaPokemon;
  }

  @override
  set listaPokemon(List<Pokemon> value) {
    _$listaPokemonAtom.reportWrite(value, super.listaPokemon, () {
      super.listaPokemon = value;
    });
  }

  final _$offsetAtom = Atom(name: 'HomeControllerBase.offset');

  @override
  int get offset {
    _$offsetAtom.reportRead();
    return super.offset;
  }

  @override
  set offset(int value) {
    _$offsetAtom.reportWrite(value, super.offset, () {
      super.offset = value;
    });
  }

  final _$loadingAtom = Atom(name: 'HomeControllerBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$modeVIewListAtom = Atom(name: 'HomeControllerBase.modeVIewList');

  @override
  bool get modeVIewList {
    _$modeVIewListAtom.reportRead();
    return super.modeVIewList;
  }

  @override
  set modeVIewList(bool value) {
    _$modeVIewListAtom.reportWrite(value, super.modeVIewList, () {
      super.modeVIewList = value;
    });
  }

  final _$HomeControllerBaseActionController =
      ActionController(name: 'HomeControllerBase');

  @override
  void changeModeView() {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.changeModeView');
    try {
      return super.changeModeView();
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listaPokemon: ${listaPokemon},
offset: ${offset},
loading: ${loading},
modeVIewList: ${modeVIewList}
    ''';
  }
}
