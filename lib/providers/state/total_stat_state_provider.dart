import 'package:flutter_riverpod/legacy.dart';

import '../../models/board_type.dart';

class TotalStatModel {
  final int stat;
  final int countCrayon1;
  final int countCrayon2;
  final int countCrayon3;

  const TotalStatModel({
    required this.stat,
    required this.countCrayon1,
    required this.countCrayon2,
    required this.countCrayon3,
  });
}

class TotalStatStateNotifier extends StateNotifier<TotalStatModel> {
  final BoardType boardType;

  TotalStatStateNotifier._(
    super.state, {
    required this.boardType,
  });

  factory TotalStatStateNotifier.initial(BoardType boardType) {
    return TotalStatStateNotifier._(
      boardType: boardType,
      TotalStatModel(
        stat: 0,
        countCrayon1: 0,
        countCrayon2: 0,
        countCrayon3: 0,
      ),
    );
  }

  void addStat(int boardNum) {
    int stat = state.stat;
    stat += boardType.increment;

    int crayon1 = state.countCrayon1;
    int crayon2 = state.countCrayon2;
    int crayon3 = state.countCrayon3;

    switch(boardNum) {
      case 1:
        crayon1++;
        break;
      case 2:
        crayon2++;
        break;
      case 3:
        crayon3++;
        break;
    }

    state = TotalStatModel(
      stat: stat,
      countCrayon1: crayon1,
      countCrayon2: crayon2,
      countCrayon3: crayon3,
    );
  }

  void subtractStat(int boardNum) {
    int stat = state.stat;
    stat -= boardType.increment;

    int crayon1 = state.countCrayon1;
    int crayon2 = state.countCrayon2;
    int crayon3 = state.countCrayon3;

    switch(boardNum) {
      case 1:
        crayon1--;
        break;
      case 2:
        crayon2--;
        break;
      case 3:
        crayon3--;
        break;
    }

    state = TotalStatModel(
      stat: stat,
      countCrayon1: crayon1,
      countCrayon2: crayon2,
      countCrayon3: crayon3,
    );
  }
}

final totalStatStateProvider = StateNotifierProvider.autoDispose.family<
    TotalStatStateNotifier, TotalStatModel, BoardType>(
  (ref, boardType) => TotalStatStateNotifier.initial(boardType),
);