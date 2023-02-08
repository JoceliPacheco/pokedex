import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/core/app_controller.dart';
import 'package:pokedex/core/app_widget.dart';
import 'package:pokedex/modules/home/home_module.dart';
import 'package:pokedex/shared/repositories/pokemon_repository.dart';
import 'package:pokedex/shared/services/http/api_request.dart';

class AppModule extends MainModule {
  final TransitionType transitionType = TransitionType.rightToLeft;
  @override
  List<Bind> get binds => [
        //Controllers
        Bind((i) => AppController()),

        //Repositories
        Bind((i) => PokemonRepository()),

        //Services
        Bind((i) => ApiRequest()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          '/home',
          module: HomeModule(),
          transition: transitionType,
        ),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
