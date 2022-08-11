import 'package:breakpoints_mq/breakpoints_mq.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cat_pics_riverpod_hooks/logic/cats_by_tags.dart';
import 'package:cat_pics_riverpod_hooks/model/response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeFutureProviderWidget extends ConsumerWidget {
  const HomeFutureProviderWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final margin = MediaQuery.of(context).breakpointMargin;
    final future = ref.watch(catsByTagsProvider);

    return future.when(
      data: (cats) {
        return ListView.builder(
          itemCount: cats.length,
          itemBuilder: (context, index) {
            final cat = cats[index];
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
      error: (error, stacktrace) {
        return Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: margin,
            ),
            child: Text('$error\n$stacktrace'),
          ),
        );
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      },
    );
  }
}
