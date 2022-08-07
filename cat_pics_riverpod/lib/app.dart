import 'package:cat_pics_riverpod/view/error.dart';
import 'package:cat_pics_riverpod/view/home.dart';
import 'package:cat_pics_riverpod/view/tag.dart';
import 'package:cat_pics_riverpod/view/tag_select.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter(
      errorBuilder: (context, state) => ErrorPage(
        errorPath: state.path ?? 'unknown',
      ),
      routes: [
        GoRoute(
          path: '/',
          pageBuilder: (context, state) => MaterialPage(
            key: state.pageKey,
            child: const HomePage(),
          ),
          routes: [
            GoRoute(
              path: 'select',
              pageBuilder: (context, state) => const MaterialPage(
                child: TagSelectPage(),
              ),
            ),
            GoRoute(
              path: 'tag',
              pageBuilder: (context, state) => MaterialPage(
                child: TagPage(
                  tag: state.queryParams['key'] ?? '',
                ),
              ),
            ),
          ],
        ),
      ],
    );

    return MaterialApp.router(
      title: 'Flutter Demo',
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
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}
