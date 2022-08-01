import 'package:cached_network_image/cached_network_image.dart';
import 'package:cat_pics/logic/cataas_service.dart';
import 'package:cat_pics/model/response.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TagPageArgs {
  TagPageArgs({
    required this.tag,
  });

  final String tag;
}

class TagPage extends StatelessWidget {
  const TagPage({
    super.key,
    required this.tag,
  });

  static const routeName = '/tag';

  final String tag;

  @override
  Widget build(BuildContext context) {
    final service = context.watch<CataasService>();

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
              return Card(
                child: CachedNetworkImage(
                  imageUrl: cat.imageUrl,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
