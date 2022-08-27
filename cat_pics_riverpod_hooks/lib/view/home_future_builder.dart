import 'package:breakpoints_mq/breakpoints_mq.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cat_pics_riverpod_hooks/logic/cataas_service.dart';
import 'package:cat_pics_riverpod_hooks/logic/select_tags.dart';
import 'package:cat_pics_riverpod_hooks/model/cat_ext.dart';
import 'package:cat_pics_riverpod_hooks/model/response.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeFutureBuilderWidget extends ConsumerWidget {
  const HomeFutureBuilderWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final margin = MediaQuery.of(context).breakpointMargin;

    final service = ref.watch(cataasServiceProvider);
    final tags = ref.watch(selectTagsProvider);

    return FutureBuilder<CatList>(
      future: service.cats(
        tags: tags,
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
                                context.push('/tag?key=$tag');
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
