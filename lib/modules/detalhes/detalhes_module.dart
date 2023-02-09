import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/modules/detalhes/detalhes_controller.dart';
import 'package:pokedex/modules/detalhes/detalhes_page.dart';

class DetalhesModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => DetalhesController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          Modular.initialRoute,
          child: (_, args) => DetalhePage(
            slug: args.data['slug'],
          ),
        ),
      ];

  static Inject get to => Inject<DetalhesModule>.of();
}
