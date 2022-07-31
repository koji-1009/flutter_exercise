// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TagList _$$_TagListFromJson(Map<String, dynamic> json) => $checkedCreate(
      r'_$_TagList',
      json,
      ($checkedConvert) {
        final val = _$_TagList(
          tags: $checkedConvert('tags',
              (v) => (v as List<dynamic>).map((e) => e as String).toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_TagListToJson(_$_TagList instance) =>
    <String, dynamic>{
      'tags': instance.tags,
    };

_$_CatList _$$_CatListFromJson(Map<String, dynamic> json) => $checkedCreate(
      r'_$_CatList',
      json,
      ($checkedConvert) {
        final val = _$_CatList(
          cats: $checkedConvert(
              'cats',
              (v) => (v as List<dynamic>)
                  .map((e) => Cat.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_CatListToJson(_$_CatList instance) =>
    <String, dynamic>{
      'cats': instance.cats.map((e) => e.toJson()).toList(),
    };

_$_Cat _$$_CatFromJson(Map<String, dynamic> json) => $checkedCreate(
      r'_$_Cat',
      json,
      ($checkedConvert) {
        final val = _$_Cat(
          id: $checkedConvert('id', (v) => v as String),
          createdAt:
              $checkedConvert('created_at', (v) => DateTime.parse(v as String)),
          tags: $checkedConvert('tags',
              (v) => (v as List<dynamic>).map((e) => e as String).toList()),
        );
        return val;
      },
      fieldKeyMap: const {'createdAt': 'created_at'},
    );

Map<String, dynamic> _$$_CatToJson(_$_Cat instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'tags': instance.tags,
    };
