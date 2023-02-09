import 'package:mobx/mobx.dart';
part 'app_controller.g.dart';

class AppController = AppControllerBase with _$AppController;

abstract class AppControllerBase with Store {
  //@TODO: Incluir carregamento dos tipos

  init() {
    return Future.delayed(Duration(seconds: 2), () => true);
  }
}
