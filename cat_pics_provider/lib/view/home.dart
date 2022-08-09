import 'package:cat_pics_provider/logic/home_tab_state.dart';
import 'package:cat_pics_provider/view/home_future.dart';
import 'package:cat_pics_provider/view/home_proxy.dart';
import 'package:cat_pics_provider/view/tag_select.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    final tabIndex = context.watch<HomeTabState>();

    final title = tabIndex.value == 0 ? 'FutureBuilder' : 'ProxyProvider';
    final body = tabIndex.value == 0
        ? const HomeFutureWidget()
        : const HomeProxyWidget();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            icon: const Icon(Icons.tag),
            onPressed: () {
              Navigator.of(context).pushNamed(TagSelectPage.routeName);
            },
          ),
        ],
      ),
      body: body,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: tabIndex.value,
        onTap: (index) {
          tabIndex.value = index;
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Future',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.fiber_new,
            ),
            label: 'Proxy',
          ),
        ],
      ),
    );
  }
}
