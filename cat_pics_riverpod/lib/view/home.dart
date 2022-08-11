import 'package:cat_pics_riverpod/logic/home_state.dart';
import 'package:cat_pics_riverpod/view/home_future_builder.dart';
import 'package:cat_pics_riverpod/view/home_future_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabIndex = ref.watch(homeTabProvider);

    final title = tabIndex == 0 ? 'FutureBuilder' : 'FutureProvider';
    final body = tabIndex == 0
        ? const HomeFutureBuilderWidget()
        : const HomeFutureProviderWidget();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            icon: const Icon(Icons.tag),
            onPressed: () {
              context.push('/select');
            },
          ),
        ],
      ),
      body: body,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: tabIndex,
        onTap: (index) {
          ref.read(homeTabProvider.notifier).state = index;
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Builder',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.fiber_new,
            ),
            label: 'Provider',
          ),
        ],
      ),
    );
  }
}
