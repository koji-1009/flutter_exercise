import 'package:breakpoints_mq/breakpoints_mq.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cat_pics_provider/logic/cataas_service.dart';
import 'package:cat_pics_provider/logic/select_state_notifier.dart';
import 'package:cat_pics_provider/model/response.dart';
import 'package:cat_pics_provider/view/tag.dart';
import 'package:cat_pics_provider/view/tag_select.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    final margin = MediaQuery.of(context).breakpointMargin;

    final service = context.watch<CataasService>();
    final selectedTags = context.select<SelectStateNotifier, List<String>>(
      (notifier) => notifier.value,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cats'),
        actions: [
          IconButton(
            icon: const Icon(Icons.tag),
            onPressed: () {
              Navigator.of(context).pushNamed(TagSelectPage.routeName);
            },
          ),
        ],
      ),
      body: FutureBuilder<CatList>(
        future: service.cats(
          tags: selectedTags,
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
                                onPressed: () {
                                  Navigator.of(context).pushNamed(
                                    TagPage.routeName,
                                    arguments: TagPageArgs(
                                      tag: tag,
                                    ),
                                  );
                                },
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