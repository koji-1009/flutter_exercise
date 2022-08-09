import 'package:breakpoints_mq/breakpoints_mq.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cat_pics_provider/logic/cats_by_tabs_notifier.dart';
import 'package:cat_pics_provider/model/response.dart';
import 'package:cat_pics_provider/view/tag.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeProxyWidget extends StatelessWidget {
  const HomeProxyWidget({super.key});

  static const String routeName = '/proxy';

  @override
  Widget build(BuildContext context) {
    final margin = MediaQuery.of(context).breakpointMargin;

    final notifier = context.watch<CatsByTagsNotifier>();
    if (notifier.isInitialLoading) {
      return const Center(
        child: CircularProgressIndicator.adaptive(),
      );
    }

    return ListView.builder(
      itemCount: notifier.cats.length,
      itemBuilder: (context, index) {
        final cat = notifier.cats[index];
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
  }
}
