import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/board_state.dart';
import '../../models/board_type.dart';
import '../../models/character_board_model.dart';
import '../../models/character_type.dart';
import '../data/board_data_provider.dart';

class BoardViewItemStateArguments {
  final int boardNumber;
  final BoardType boardType;
  final CharacterType characterType;
  final CharacterBoardModel characterBoard;

  const BoardViewItemStateArguments({
    required this.boardNumber,
    required this.boardType,
    required this.characterType,
    required this.characterBoard,
  });

  @override
  bool operator ==(Object other) {
    return other is BoardViewItemStateArguments
        && boardNumber == other.boardNumber
        && boardType == other.boardType
        && characterType == other.characterType
        && characterBoard == other.characterBoard;
  }

  @override
  int get hashCode => super.hashCode;
}

final boardViewItemStateProvider = Provider.family<BoardState, BoardViewItemStateArguments>(
  (ref, arguments) {
    if(arguments.boardNumber == 1) {
      return ref.watch(board1stDataStateProvider.select(
        (data) => data[arguments.boardType]![arguments.characterType]!.firstWhere(
          ((character) => arguments.characterBoard == character.characterBoard),
        ).state,
      ));
    } else if(arguments.boardNumber == 2) {
      return ref.watch(board2ndDataStateProvider.select(
        (data) => data[arguments.boardType]![arguments.characterType]!.firstWhere(
          ((character) => arguments.characterBoard == character.characterBoard),
        ).state,
      ));
    } else {
      return ref.watch(board3rdDataStateProvider.select(
        (data) => data[arguments.boardType]![arguments.characterType]!.firstWhere(
          ((character) => arguments.characterBoard == character.characterBoard),
        ).state,
      ));
    }
  },
);