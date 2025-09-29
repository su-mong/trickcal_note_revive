import 'package:flutter_riverpod/legacy.dart';
import 'package:trickcal_note_revive/models/board_type.dart';

class BoardViewNotifier extends StateNotifier<Map<BoardType, bool>> {
  BoardViewNotifier(super.state);

  factory BoardViewNotifier.initial() => BoardViewNotifier({
    BoardType.attack: true,
    BoardType.physicalDefense: true,
    BoardType.magicalDefense: true,
    BoardType.fatalBlow: true,
    BoardType.fatalDamage: true,
    BoardType.fatalBlowDefense: true,
    BoardType.fatalDamageDefense: true,
    BoardType.hp: true,
  });

  void toggleBoardView(BoardType boardType) {
    final newState = Map<BoardType, bool>.from(state);
    newState[boardType] = !newState[boardType]!;
    state = newState;
  }
}

final currentBoardViewStateProvider = StateNotifierProvider<BoardViewNotifier, Map<BoardType, bool>>(
  (ref) => BoardViewNotifier.initial(),
);