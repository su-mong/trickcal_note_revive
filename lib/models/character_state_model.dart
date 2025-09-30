import 'package:freezed_annotation/freezed_annotation.dart';

import 'board_state.dart';
import 'character_constants.dart';
import 'character_model.dart';

part 'character_state_model.freezed.dart';
part 'character_state_model.g.dart';

@freezed
abstract class CharacterStateModel with _$CharacterStateModel {
  const factory CharacterStateModel(
    CharacterModel character,
    BoardState state,
  ) = _CharacterStateModel;

  factory CharacterStateModel.fromJson(Map<String, dynamic> json) {
    final character = CharacterConstants.findCharacter(json['character'] as int);

    return _CharacterStateModel(
      character,
      $enumDecode(_$BoardStateEnumMap, json['state']),
    );
  }
}

extension CharacterStateModelExtension on CharacterStateModel {
  Map<String, dynamic> toJsonShort() {
    return {
      'character': character.id,
      'state': _$BoardStateEnumMap[state]!,
    };
  }
}