import 'package:cached_network_image/cached_network_image.dart';
import 'package:cat_pics/logic/cataas_service.dart';
import 'package:cat_pics/logic/select_state_notifier.dart';
import 'package:cat_pics/model/response.dart';
import 'package:cat_pics/view/tag.dart';
import 'package:cat_pics/view/tag_select.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
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
              return Card(
                child: Column(
                  children: [
                    CachedNetworkImage(
                      imageUrl: cat.imageUrl,
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
              );
            },
          );
        },
      ),
    );
  }
}
