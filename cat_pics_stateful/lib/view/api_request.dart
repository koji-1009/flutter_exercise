import 'package:cat_pics_stateful/logic/cataas_service.dart';
import 'package:flutter/widgets.dart';

class ApiRequest extends InheritedWidget {
  const ApiRequest({
    super.key,
    required super.child,
    required this.service,
  });

  final CataasService service;

  static ApiRequest of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<ApiRequest>();
    assert(result != null, 'No ApiRequest found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(ApiRequest oldWidget) => service != oldWidget.service;
}
