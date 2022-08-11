import 'package:cat_pics_riverpod_hooks/logic/cataas_service.dart';
import 'package:cat_pics_riverpod_hooks/logic/select_tags.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final catsByTagsProvider = FutureProvider(
  (ref) async {
    final service = ref.watch(cataasServiceProvider);
    final tags = ref.watch(selectTagsProvider);

    final response = await service.cats(
      tags: tags,
    );

    return response.cats;
  },
);
