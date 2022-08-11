import 'dart:convert';

import 'package:cat_pics_riverpod_hooks/model/response.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

final cataasServiceProvider = Provider(
  (_) => CataasService(
    client: http.Client(),
  ),
);

class CataasService {
  CataasService({
    required this.client,
  });

  final http.Client client;

  Future<TagList> tags() async {
    final uri = Uri.https(
      'cataas.com',
      'api/tags',
    );
    final response = await client.get(uri);

    return TagList.fromJson({
      'tags': jsonDecode(response.body),
    });
  }

  Future<CatList> cats({
    required List<String> tags,
  }) async {
    final uri = Uri.https(
      'cataas.com',
      'api/cats',
      {
        'tags': tags.join(','),
      },
    );
    final response = await client.get(uri);

    return CatList.fromJson({
      'cats': jsonDecode(response.body),
    });
  }
}
