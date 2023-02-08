import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/core/app_controller.dart';
import 'package:pokedex/core/app_widget.dart';
import 'package:pokedex/modules/home/home_module.dart';

class AppModule extends MainModule {
  final TransitionType transitionType = TransitionType.rightToLeft;
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
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
