import 'package:flutter_riverpod/legacy.dart';
import 'package:trickcal_note_revive/models/board_type.dart';

final currentBoardTypeStateProvider = StateProvider<BoardType>(
  (ref) => BoardType.attack,
);