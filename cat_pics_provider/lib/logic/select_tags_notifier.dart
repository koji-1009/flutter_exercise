import 'package:flutter/foundation.dart';

class SelectTagsNotifier extends ValueNotifier<List<String>> {
  SelectTagsNotifier() : super(const []);

  void update({
    required List<String> tags,
  }) {
    value = tags;
  }
}
