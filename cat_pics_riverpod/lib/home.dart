import 'package:breakpoints_mq/breakpoints_mq.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cat_pics_riverpod/logic/cataas_service.dart';
import 'package:cat_pics_riverpod/model/response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  static const String routeName = '/';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final margin = MediaQuery.of(context).breakpointMargin;
    final service = ref.watch(cataasServiceProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cats'),
        actions: [
          IconButton(
            icon: const Icon(Icons.tag),
            onPressed: () {},
          ),
        ],
      ),
      body: FutureBuilder<CatList>(
        future: service.cats(
          tags: const [],
        ),
        builder: (context, snapshot) {
          final data = snapshot.data;
          if (data == null) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }

          return ListView.builder(
            itemCount: data.cats.length,
            itemBuilder: (context, index) {
              final cat = data.cats[index];
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: margin,
                ),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        CachedNetworkImage(
                          imageUrl: cat.imageUrl,
                          placeholder: (_, __) => const Center(
                            child: SizedBox.square(
                              dimension: 120,
                              child: CircularProgressIndicator.adaptive(),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Wrap(
                          children: [
                            ...cat.tags.map(
                              (tag) => TextButton(
                                onPressed: () {},
                                child: Text(tag),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
