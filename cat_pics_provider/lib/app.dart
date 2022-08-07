import 'package:cat_pics_provider/logic/cataas_service.dart';
import 'package:cat_pics_provider/logic/select_state_notifier.dart';
import 'package:cat_pics_provider/view/error.dart';
import 'package:cat_pics_provider/view/home.dart';
import 'package:cat_pics_provider/view/tag.dart';
import 'package:cat_pics_provider/view/tag_select.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) => CataasService(
            client: http.Client(),
          ),
        ),
        ChangeNotifierProvider<SelectStateNotifier>(
          create: (_) => SelectStateNotifier(),
        ),
      ],
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
                builder: (_) => const HomePage(),
              );
            case TagSelectPage.routeName:
              return MaterialPageRoute(
                builder: (_) => const TagSelectPage(),
              );
            case TagPage.routeName:
              final args = settings.arguments as TagPageArgs;
              return MaterialPageRoute(
                builder: (_) => TagPage(
                  tag: args.tag,
                ),
              );
            default:
              return MaterialPageRoute(
                builder: (_) => ErrorPage(
                  errorPath: settings.name ?? '',
                ),
              );
          }
        },
      ),
    );
  }
}
