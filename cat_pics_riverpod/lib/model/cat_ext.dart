import 'package:cat_pics_riverpod/logic/api_config.dart';
import 'package:cat_pics_riverpod/model/response.dart';

extension CatExt on Cat {
  String get imageUrl => Uri.https(
        ApiConfig.authority,
        '${ApiConfig.pathCat}/$id',
      ).toString();
}
