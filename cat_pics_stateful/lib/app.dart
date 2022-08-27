import 'package:cat_pics_stateful/logic/cataas_service.dart';
import 'package:cat_pics_stateful/view/api_request.dart';
import 'package:cat_pics_stateful/view/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ApiRequest(
      service: CataasService(
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
        home: const HomePage(),
      ),
    );
  }
}
