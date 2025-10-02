import 'package:freezed_annotation/freezed_annotation.dart';

import 'character_model.dart';

part 'character_board_model.freezed.dart';

@freezed
abstract class CharacterBoardModel with _$CharacterBoardModel {
  const factory CharacterBoardModel(
    CharacterModel character,
    int goldCrayon,
    int purpleCrayon,
  ) = _CharacterBoardModel;
}