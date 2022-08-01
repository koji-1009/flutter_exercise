import 'package:cat_pics/home.dart';
import 'package:cat_pics/logic/cataas_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cat Pics',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Provider(
        create: (_) => CataasService(
          client: http.Client(),
        ),
        child: const HomePage(),
      ),
    );
  }
}
