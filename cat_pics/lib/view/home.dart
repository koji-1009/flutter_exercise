import 'package:cached_network_image/cached_network_image.dart';
import 'package:cat_pics/logic/cataas_service.dart';
import 'package:cat_pics/model/response.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    final service = context.watch<CataasService>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: FutureBuilder<CatList>(
        future: service.cats(),
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
                          (e) => TextButton(
                            onPressed: () {},
                            child: Text(e),
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
