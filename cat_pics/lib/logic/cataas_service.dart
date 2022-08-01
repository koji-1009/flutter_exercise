import 'dart:convert';

import 'package:cat_pics/model/response.dart';
import 'package:http/http.dart' as http;

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
