import 'package:cat_pics/view/error.dart';
import 'package:cat_pics/view/home.dart';
import 'package:cat_pics/logic/cataas_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => CataasService(
        client: http.Client(),
      ),
      child: MaterialApp(
        title: 'Cat Pics',
        theme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.light,
          colorSchemeSeed: Colors.blue,
        ),
        darkTheme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.dark,
          colorSchemeSeed: Colors.blue,
        ),
        initialRoute: HomePage.routeName,
        routes: {
          HomePage.routeName: (context) => const HomePage(),
        },
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case HomePage.routeName:
              return MaterialPageRoute(
                builder: (context) => const HomePage(),
              );
            default:
              return MaterialPageRoute(
                builder: (context) => ErrorPage(
                  errorPath: settings.name ?? '',
                ),
              );
          }
        },
      ),
    );
  }
}
