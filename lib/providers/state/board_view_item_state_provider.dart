import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/board_state.dart';
import '../../models/board_type.dart';
import '../../models/character_model.dart';
import '../../models/character_type.dart';
import '../data/board_data_provider.dart';

class BoardViewItemStateArguments {
  final int boardNumber;
  final BoardType boardType;
  final CharacterType characterType;
  final CharacterModel character;

  const BoardViewItemStateArguments({
    required this.boardNumber,
    required this.boardType,
    required this.characterType,
    required this.character,
  });

  @override
  bool operator ==(Object other) {
    return other is BoardViewItemStateArguments
        && boardNumber == other.boardNumber
        && boardType == other.boardType
        && characterType == other.characterType
        && character == other.character;
  }

  @override
  int get hashCode => super.hashCode;
}

final boardViewItemStateProvider = Provider.family<BoardState, BoardViewItemStateArguments>(
  (ref, arguments) {
    return ref.watch(board1stDataStateProvider.select(
      (data) => data[arguments.boardType]![arguments.characterType]!.firstWhere(
        ((character) => arguments.character == character.character),
      ).state,
    ));
  },
);