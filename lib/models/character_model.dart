import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trickcal_note_revive/models/character_constants.dart';
import 'package:trickcal_note_revive/models/character_type.dart';

part 'character_model.freezed.dart';
part 'character_model.g.dart';

@freezed
abstract class CharacterModel with _$CharacterModel {
  const factory CharacterModel({
    required int id,
    required String name,
    required String engName,
    required CharacterType type,
  }) = _CharacterModel;

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    final int id = (json['id'] as num).toInt();
    return CharacterConstants.findCharacter(id);
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
    };
  }
}