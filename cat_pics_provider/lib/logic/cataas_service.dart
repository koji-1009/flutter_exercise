import 'dart:convert';

import 'package:cat_pics_provider/logic/api_config.dart';
import 'package:cat_pics_provider/model/response.dart';
import 'package:http/http.dart' as http;

class CataasService {
  const CataasService({
    required this.client,
  });

  final http.Client client;

  Future<CatList> cats({
    required List<String> tags,
  }) async {
    final uri = Uri.https(
      ApiConfig.authority,
      ApiConfig.pathApiCats,
      {
        'tags': tags.join(','),
      },
    );
    final response = await client.get(uri);

    return CatList.fromJson({
      'cats': jsonDecode(response.body),
    });
  }

  Future<TagList> tags() async {
    final uri = Uri.https(
      ApiConfig.authority,
      ApiConfig.pathApiTags,
    );
    final response = await client.get(uri);

    return TagList.fromJson({
      'tags': jsonDecode(response.body),
    });
  }
}
