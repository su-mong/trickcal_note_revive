import 'package:freezed_annotation/freezed_annotation.dart';

import 'board_state.dart';
import 'character_board_model.dart';
import 'character_constants.dart';
import 'character_model.dart';

part 'character_state_model.freezed.dart';
part 'character_state_model.g.dart';

@freezed
abstract class CharacterStateModel with _$CharacterStateModel {
  const factory CharacterStateModel(
    CharacterBoardModel characterBoard,
    BoardState state,
  ) = _CharacterStateModel;

  factory CharacterStateModel.fromJson(Map<String, dynamic> json) {
    final characterBoard = CharacterConstants.findCharacter(json['characterBoard'] as int);

    return _CharacterStateModel(
      CharacterBoardModel(BriskCharacterConstants.vela, 0, 0), //characterBoard,
      $enumDecode(_$BoardStateEnumMap, json['state']),
    );
  }
}

extension CharacterStateModelExtension on CharacterStateModel {
  Map<String, dynamic> toJsonShort() {
    return {
      'characterBoard': -7,
      // 'characterBoard': characterBoard.id,
      'state': _$BoardStateEnumMap[state]!,
    };
  }
}