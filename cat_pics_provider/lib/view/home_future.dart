import 'package:breakpoints_mq/breakpoints_mq.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cat_pics_provider/logic/cataas_service.dart';
import 'package:cat_pics_provider/logic/select_tags_notifier.dart';
import 'package:cat_pics_provider/model/response.dart';
import 'package:cat_pics_provider/view/tag.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeFutureWidget extends StatelessWidget {
  const HomeFutureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final margin = MediaQuery.of(context).breakpointMargin;

    final service = context.watch<CataasService>();
    final selectedTags = context.select<SelectTagsNotifier, List<String>>(
      (notifier) => notifier.value,
    );

    return FutureBuilder<CatList>(
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
                        placeholder: (_, __) => const SizedBox.square(
                          dimension: 120,
                          child: Center(
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
    );
  }
}
