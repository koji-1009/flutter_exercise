import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'response.freezed.dart';
part 'response.g.dart';

@freezed
class TagList with _$TagList {
  const factory TagList({
    @Default([]) List<String> tags,
  }) = _TagList;

  factory TagList.fromJson(Map<String, dynamic> json) =>
      _$TagListFromJson(json);
}

@freezed
class CatList with _$CatList {
  const factory CatList({
    @Default([]) List<Cat> cats,
  }) = _CatList;

  factory CatList.fromJson(Map<String, dynamic> json) =>
      _$CatListFromJson(json);
}

@freezed
class Cat with _$Cat {
  const factory Cat({
    required String id,
    required DateTime createdAt,
    required List<String> tags,
  }) = _Cat;

  factory Cat.fromJson(Map<String, dynamic> json) => _$CatFromJson(json);
}
