// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TagList _$TagListFromJson(Map<String, dynamic> json) {
  return _TagList.fromJson(json);
}

/// @nodoc
mixin _$TagList {
  List<String> get tags => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TagListCopyWith<TagList> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TagListCopyWith<$Res> {
  factory $TagListCopyWith(TagList value, $Res Function(TagList) then) =
      _$TagListCopyWithImpl<$Res>;
  $Res call({List<String> tags});
}

/// @nodoc
class _$TagListCopyWithImpl<$Res> implements $TagListCopyWith<$Res> {
  _$TagListCopyWithImpl(this._value, this._then);

  final TagList _value;
  // ignore: unused_field
  final $Res Function(TagList) _then;

  @override
  $Res call({
    Object? tags = freezed,
  }) {
    return _then(_value.copyWith(
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$$_TagListCopyWith<$Res> implements $TagListCopyWith<$Res> {
  factory _$$_TagListCopyWith(
          _$_TagList value, $Res Function(_$_TagList) then) =
      __$$_TagListCopyWithImpl<$Res>;
  @override
  $Res call({List<String> tags});
}

/// @nodoc
class __$$_TagListCopyWithImpl<$Res> extends _$TagListCopyWithImpl<$Res>
    implements _$$_TagListCopyWith<$Res> {
  __$$_TagListCopyWithImpl(_$_TagList _value, $Res Function(_$_TagList) _then)
      : super(_value, (v) => _then(v as _$_TagList));

  @override
  _$_TagList get _value => super._value as _$_TagList;

  @override
  $Res call({
    Object? tags = freezed,
  }) {
    return _then(_$_TagList(
      tags: tags == freezed
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TagList with DiagnosticableTreeMixin implements _TagList {
  const _$_TagList({required final List<String> tags}) : _tags = tags;

  factory _$_TagList.fromJson(Map<String, dynamic> json) =>
      _$$_TagListFromJson(json);

  final List<String> _tags;
  @override
  List<String> get tags {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TagList(tags: $tags)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TagList'))
      ..add(DiagnosticsProperty('tags', tags));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TagList &&
            const DeepCollectionEquality().equals(other._tags, _tags));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_tags));

  @JsonKey(ignore: true)
  @override
  _$$_TagListCopyWith<_$_TagList> get copyWith =>
      __$$_TagListCopyWithImpl<_$_TagList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TagListToJson(
      this,
    );
  }
}

abstract class _TagList implements TagList {
  const factory _TagList({required final List<String> tags}) = _$_TagList;

  factory _TagList.fromJson(Map<String, dynamic> json) = _$_TagList.fromJson;

  @override
  List<String> get tags;
  @override
  @JsonKey(ignore: true)
  _$$_TagListCopyWith<_$_TagList> get copyWith =>
      throw _privateConstructorUsedError;
}

CatList _$CatListFromJson(Map<String, dynamic> json) {
  return _CatList.fromJson(json);
}

/// @nodoc
mixin _$CatList {
  List<Cat> get cats => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CatListCopyWith<CatList> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CatListCopyWith<$Res> {
  factory $CatListCopyWith(CatList value, $Res Function(CatList) then) =
      _$CatListCopyWithImpl<$Res>;
  $Res call({List<Cat> cats});
}

/// @nodoc
class _$CatListCopyWithImpl<$Res> implements $CatListCopyWith<$Res> {
  _$CatListCopyWithImpl(this._value, this._then);

  final CatList _value;
  // ignore: unused_field
  final $Res Function(CatList) _then;

  @override
  $Res call({
    Object? cats = freezed,
  }) {
    return _then(_value.copyWith(
      cats: cats == freezed
          ? _value.cats
          : cats // ignore: cast_nullable_to_non_nullable
              as List<Cat>,
    ));
  }
}

/// @nodoc
abstract class _$$_CatListCopyWith<$Res> implements $CatListCopyWith<$Res> {
  factory _$$_CatListCopyWith(
          _$_CatList value, $Res Function(_$_CatList) then) =
      __$$_CatListCopyWithImpl<$Res>;
  @override
  $Res call({List<Cat> cats});
}

/// @nodoc
class __$$_CatListCopyWithImpl<$Res> extends _$CatListCopyWithImpl<$Res>
    implements _$$_CatListCopyWith<$Res> {
  __$$_CatListCopyWithImpl(_$_CatList _value, $Res Function(_$_CatList) _then)
      : super(_value, (v) => _then(v as _$_CatList));

  @override
  _$_CatList get _value => super._value as _$_CatList;

  @override
  $Res call({
    Object? cats = freezed,
  }) {
    return _then(_$_CatList(
      cats: cats == freezed
          ? _value._cats
          : cats // ignore: cast_nullable_to_non_nullable
              as List<Cat>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CatList with DiagnosticableTreeMixin implements _CatList {
  const _$_CatList({required final List<Cat> cats}) : _cats = cats;

  factory _$_CatList.fromJson(Map<String, dynamic> json) =>
      _$$_CatListFromJson(json);

  final List<Cat> _cats;
  @override
  List<Cat> get cats {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cats);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CatList(cats: $cats)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CatList'))
      ..add(DiagnosticsProperty('cats', cats));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CatList &&
            const DeepCollectionEquality().equals(other._cats, _cats));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_cats));

  @JsonKey(ignore: true)
  @override
  _$$_CatListCopyWith<_$_CatList> get copyWith =>
      __$$_CatListCopyWithImpl<_$_CatList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CatListToJson(
      this,
    );
  }
}

abstract class _CatList implements CatList {
  const factory _CatList({required final List<Cat> cats}) = _$_CatList;

  factory _CatList.fromJson(Map<String, dynamic> json) = _$_CatList.fromJson;

  @override
  List<Cat> get cats;
  @override
  @JsonKey(ignore: true)
  _$$_CatListCopyWith<_$_CatList> get copyWith =>
      throw _privateConstructorUsedError;
}

Cat _$CatFromJson(Map<String, dynamic> json) {
  return _Cat.fromJson(json);
}

/// @nodoc
mixin _$Cat {
  String get id => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CatCopyWith<Cat> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CatCopyWith<$Res> {
  factory $CatCopyWith(Cat value, $Res Function(Cat) then) =
      _$CatCopyWithImpl<$Res>;
  $Res call({String id, DateTime createdAt, List<String> tags});
}

/// @nodoc
class _$CatCopyWithImpl<$Res> implements $CatCopyWith<$Res> {
  _$CatCopyWithImpl(this._value, this._then);

  final Cat _value;
  // ignore: unused_field
  final $Res Function(Cat) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? tags = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$$_CatCopyWith<$Res> implements $CatCopyWith<$Res> {
  factory _$$_CatCopyWith(_$_Cat value, $Res Function(_$_Cat) then) =
      __$$_CatCopyWithImpl<$Res>;
  @override
  $Res call({String id, DateTime createdAt, List<String> tags});
}

/// @nodoc
class __$$_CatCopyWithImpl<$Res> extends _$CatCopyWithImpl<$Res>
    implements _$$_CatCopyWith<$Res> {
  __$$_CatCopyWithImpl(_$_Cat _value, $Res Function(_$_Cat) _then)
      : super(_value, (v) => _then(v as _$_Cat));

  @override
  _$_Cat get _value => super._value as _$_Cat;

  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? tags = freezed,
  }) {
    return _then(_$_Cat(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      tags: tags == freezed
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Cat with DiagnosticableTreeMixin implements _Cat {
  const _$_Cat(
      {required this.id,
      required this.createdAt,
      required final List<String> tags})
      : _tags = tags;

  factory _$_Cat.fromJson(Map<String, dynamic> json) => _$$_CatFromJson(json);

  @override
  final String id;
  @override
  final DateTime createdAt;
  final List<String> _tags;
  @override
  List<String> get tags {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Cat(id: $id, createdAt: $createdAt, tags: $tags)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Cat'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('tags', tags));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Cat &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other._tags, _tags));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(_tags));

  @JsonKey(ignore: true)
  @override
  _$$_CatCopyWith<_$_Cat> get copyWith =>
      __$$_CatCopyWithImpl<_$_Cat>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CatToJson(
      this,
    );
  }
}

abstract class _Cat implements Cat {
  const factory _Cat(
      {required final String id,
      required final DateTime createdAt,
      required final List<String> tags}) = _$_Cat;

  factory _Cat.fromJson(Map<String, dynamic> json) = _$_Cat.fromJson;

  @override
  String get id;
  @override
  DateTime get createdAt;
  @override
  List<String> get tags;
  @override
  @JsonKey(ignore: true)
  _$$_CatCopyWith<_$_Cat> get copyWith => throw _privateConstructorUsedError;
}
