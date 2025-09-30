// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CharacterModel _$CharacterModelFromJson(Map<String, dynamic> json) =>
    _CharacterModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      engName: json['engName'] as String,
      type: $enumDecode(_$CharacterTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$CharacterModelToJson(_CharacterModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'engName': instance.engName,
      'type': _$CharacterTypeEnumMap[instance.type]!,
    };

const _$CharacterTypeEnumMap = {
  CharacterType.cool: 'cool',
  CharacterType.gloomy: 'gloomy',
  CharacterType.brisk: 'brisk',
  CharacterType.crazy: 'crazy',
  CharacterType.pure: 'pure',
};
