import 'package:breakpoints_mq/breakpoints_mq.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cat_pics_riverpod/logic/cataas_service.dart';
import 'package:cat_pics_riverpod/model/response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TagPage extends ConsumerWidget {
  const TagPage({
    super.key,
    required this.tag,
  });

  final String tag;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final margin = MediaQuery.of(context).breakpointMargin;

    final service = ref.watch(cataasServiceProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Tag = $tag'),
      ),
      body: FutureBuilder<CatList>(
        future: service.cats(
          tags: [tag],
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
                  child: IntrinsicHeight(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: CachedNetworkImage(
                        imageUrl: cat.imageUrl,
                        placeholder: (_, __) => const SizedBox.square(
                          dimension: 120,
                          child: Center(
                            child: CircularProgressIndicator.adaptive(),
                          ),
                        ),
                      ),
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
