import 'package:breakpoints_mq/breakpoints_mq.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cat_pics_stateful/model/response.dart';
import 'package:cat_pics_stateful/view/api_request.dart';
import 'package:flutter/material.dart';

class TagPage extends StatefulWidget {
  const TagPage({
    super.key,
    required this.tag,
  });

  final String tag;

  @override
  State<TagPage> createState() => _TagPageState();
}

class _TagPageState extends State<TagPage> {
  @override
  Widget build(BuildContext context) {
    final margin = MediaQuery.of(context).breakpointMargin;
    final service = ApiRequest.of(context).service;

    return Scaffold(
      appBar: AppBar(
        title: Text('Tag = ${widget.tag}'),
      ),
      body: FutureBuilder<CatList>(
        future: service.cats(
          tags: [widget.tag],
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
              );
            },
          );
        },
      ),
    );
  }
}
