import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:pokedex/core/app_controller.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  AppController controller = Modular.get();
  final Map _app = {'widget': null};

  @override
  initState() {
    super.initState();
    Intl.defaultLocale = 'pt_BR';
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: FutureBuilder<bool>(
        future: controller.init(),
        builder: (_, AsyncSnapshot<bool> snapshot) {
          if (snapshot.hasData) {
            return _buildApp(context);
          }
          //return SplashScreen();
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget _buildApp(BuildContext context) {
    /// Se já buildou o app anteriormente, retorna a mesma instância
    if (_app['widget'] != null) {
      return _app['widget'];
    }

    /// Cria uma instância e passa a usar sempre a mesma
    return _app['widget'] = MaterialApp(
      navigatorKey: Modular.navigatorKey,
      title: 'POKEDEX',
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      themeMode: ThemeMode.system,
      onGenerateRoute: Modular.generateRoute,
      navigatorObservers: [
        /* AppRouteObserver(),
        FirebaseAnalyticsObserver(
            analytics: AnalyticsService.analytics,
            onError: (e) {
              print('####### ERRO WIDGET #######');
              print(e);
            }), */
      ],
      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        // GlobalMaterialLocalizations.delegate,
        //GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [Locale('pt', 'BR')],
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: Material(
          child: child,
        ),
      ),
      //theme: controller.themeData,
    );
  }
}
