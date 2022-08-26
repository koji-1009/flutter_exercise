import 'dart:convert';

import 'package:cat_pics_riverpod_hooks/model/response.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

final cataasServiceProvider = Provider(
  (_) => CataasService(
    client: http.Client(),
  ),
);

const _authority = 'cataas.com';
const _pathCats = 'api/cats';
const _pathTags = 'api/tags';

class CataasService {
  const CataasService({
    required this.client,
  });

  final http.Client client;

  Future<TagList> tags() async {
    final uri = Uri.https(
      _authority,
      _pathTags,
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
      _authority,
      _pathCats,
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
