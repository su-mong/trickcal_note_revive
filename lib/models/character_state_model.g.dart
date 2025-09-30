// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_state_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CharacterStateModel _$CharacterStateModelFromJson(Map<String, dynamic> json) =>
    _CharacterStateModel(
      CharacterModel.fromJson(json['character'] as Map<String, dynamic>),
      $enumDecode(_$BoardStateEnumMap, json['state']),
    );

Map<String, dynamic> _$CharacterStateModelToJson(
  _CharacterStateModel instance,
) => <String, dynamic>{
  'character': instance.character,
  'state': _$BoardStateEnumMap[instance.state]!,
};

const _$BoardStateEnumMap = {
  BoardState.notHave: 'n',
  BoardState.lock: 'l',
  BoardState.inactive: 'i',
  BoardState.active: 'a',
};
