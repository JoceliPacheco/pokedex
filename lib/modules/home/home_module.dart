import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/modules/home/home_controller.dart';
import 'package:pokedex/modules/home/home_page.dart';
import 'package:pokedex/shared/services/pokemon/get_pokemon_service.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController()),
        Bind((i) => GetPokemonService()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          Modular.initialRoute,
          child: (_, args) => HomePage(),
        ),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
