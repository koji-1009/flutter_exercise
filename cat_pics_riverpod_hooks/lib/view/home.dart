import 'package:cat_pics_riverpod_hooks/view/home_future_builder.dart';
import 'package:cat_pics_riverpod_hooks/view/home_future_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabIndex = useState(0);

    final title = tabIndex.value == 0 ? 'FutureBuilder' : 'FutureProvider';
    final body = tabIndex.value == 0
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
        currentIndex: tabIndex.value,
        onTap: (index) {
          tabIndex.value = index;
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
