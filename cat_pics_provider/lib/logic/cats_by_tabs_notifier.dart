import 'package:cat_pics_provider/logic/cataas_service.dart';
import 'package:cat_pics_provider/model/response.dart';
import 'package:flutter/foundation.dart';

class CatsByTagsNotifier extends ChangeNotifier {
  CatsByTagsNotifier({
    required this.service,
    required List<String> tags,
  }) {
    Future(() async {
      await update(
        tags: tags,
      );

      isInitialLoading = false;
      notifyListeners();
    });
  }

  final CataasService service;
  final List<Cat> cats = [];
  bool isInitialLoading = true;

  Future<void> update({
    required List<String> tags,
  }) async {
    final catsList = await service.cats(
      tags: tags,
    );

    cats.clear();
    cats.addAll(catsList.cats);

    notifyListeners();
  }
}
