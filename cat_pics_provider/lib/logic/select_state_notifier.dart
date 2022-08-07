import 'package:flutter/foundation.dart';

class SelectStateNotifier extends ValueNotifier<List<String>> {
  SelectStateNotifier() : super(const []);

  void update({
    required List<String> newList,
  }) {
    value = newList;
  }
}
