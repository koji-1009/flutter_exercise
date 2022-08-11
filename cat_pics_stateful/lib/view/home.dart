import 'package:breakpoints_mq/breakpoints_mq.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cat_pics_stateful/model/response.dart';
import 'package:cat_pics_stateful/view/api_request.dart';
import 'package:cat_pics_stateful/view/tag.dart';
import 'package:cat_pics_stateful/view/tag_select.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _loading = false;

  List<Cat> _cats = [];
  List<String> _tags = [];

  Future<void> _fetch() async {
    setState(() {
      _loading = true;
    });

    final service = ApiRequest.of(context).service;
    final response = await service.cats(
      tags: _tags,
    );

    setState(() {
      _cats = response.cats;
      _loading = false;
    });
  }

  @override
  void initState() {
    Future(() async {
      await _fetch();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final margin = MediaQuery.of(context).breakpointMargin;

    return Scaffold(
      appBar: AppBar(
        title: const Text('StatefulWidget'),
        actions: [
          IconButton(
            icon: const Icon(Icons.tag),
            onPressed: () async {
              final newTags = await Navigator.of(context).push<List<String>>(
                MaterialPageRoute<List<String>>(
                  builder: (_) => TagSelectPage(
                    initialTags: _tags,
                  ),
                ),
              );

              if (newTags == null) {
                // cancel
                return;
              }

              _tags = newTags;
              await _fetch();
            },
          ),
        ],
      ),
      body: _loading
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : ListView.builder(
              itemCount: _cats.length,
              itemBuilder: (context, index) {
                final cat = _cats[index];
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
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (_) => TagPage(
                                          tag: tag,
                                        ),
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
            ),
    );
  }
}
