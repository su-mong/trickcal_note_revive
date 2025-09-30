import 'package:flutter_riverpod/legacy.dart';
import 'package:trickcal_note_revive/models/board_type.dart';

class BoardViewNotifier extends StateNotifier<Map<BoardType, bool>> {
  static const Map<BoardType, bool> _initial = {
    BoardType.attack: true,
    BoardType.physicalDefense: false,
    BoardType.magicalDefense: false,
    BoardType.fatalBlow: true,
    BoardType.fatalDamage: true,
    BoardType.fatalBlowDefense: true,
    BoardType.fatalDamageDefense: true,
    BoardType.hp: true,
  };

  BoardViewNotifier(super.state);

  factory BoardViewNotifier.initial() => BoardViewNotifier(_initial);

  void toggleBoardView(BoardType boardType) {
    final newState = Map<BoardType, bool>.from(state);
    newState[boardType] = !newState[boardType]!;
    state = newState;
  }

  void loadFromJson(Map<String, dynamic>? json) {
    if(json == null) {
      state = _initial;
      return;
    }

    state = json.map(
      (boardTypeStr, value) => MapEntry(
        boardTypeStr.toBoardType,
        value,
      ),
    );
  }

  Map<String, dynamic> get toJson => state.map(
    (boardType, value) => MapEntry(
      boardType.code,
      value,
    ),
  );
}

final currentBoardViewStateProvider = StateNotifierProvider<BoardViewNotifier, Map<BoardType, bool>>(
  (ref) => BoardViewNotifier.initial(),
);