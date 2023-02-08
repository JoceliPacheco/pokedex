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

  @override
  String toString() {
    return '''
listaPokemon: ${listaPokemon},
offset: ${offset}
    ''';
  }
}
