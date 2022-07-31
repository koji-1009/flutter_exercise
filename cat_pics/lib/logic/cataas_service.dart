import 'dart:convert';

import 'package:cat_pics/model/response.dart';
import 'package:http/http.dart' as http;

class CataasService {
  CataasService({
    required this.client,
  });

  final http.Client client;

  Future<CatList> tags() async {
    final uri = Uri.https(
      'cataas.com',
      'api/tags',
    );
    final response = await client.get(uri);

    return CatList.fromJson({
      'tags': jsonDecode(response.body),
    });
  }

  Future<CatList> cats({
    List<String> tags = const [],
  }) async {
    final uri = Uri.https(
      'cataas.com',
      'api/cats',
      {
        'tags': tags,
      },
    );
    final response = await client.get(uri);

    return CatList.fromJson({
      'cats': jsonDecode(response.body),
    });
  }
}
