import 'package:flutter_riverpod/legacy.dart';
import 'package:trickcal_note_revive/models/board_constants.dart';

class TotalGoldCrayonModel {
  final int totalCount;
  final int countBoardNum1;
  final int countBoardNum2;
  final int countBoardNum3;

  const TotalGoldCrayonModel({
    required this.totalCount,
    required this.countBoardNum1,
    required this.countBoardNum2,
    required this.countBoardNum3,
  });
}

class TotalGoldCrayonStateNotifier extends StateNotifier<TotalGoldCrayonModel> {
  TotalGoldCrayonStateNotifier._(super.state);

  factory TotalGoldCrayonStateNotifier.initial() => TotalGoldCrayonStateNotifier._(
    TotalGoldCrayonModel(
      totalCount: 0,
      countBoardNum1: 0,
      countBoardNum2: 0,
      countBoardNum3: 0,
    ),
  );

  void add(int boardNumber) {
    int totalCount = state.totalCount;
    int crayon1 = state.countBoardNum1;
    int crayon2 = state.countBoardNum2;
    int crayon3 = state.countBoardNum3;

    switch(boardNumber) {
      case 1:
        totalCount += BoardConstants.goldCrayon1stBoard;
        crayon1++;
        break;
      case 2:
        totalCount += BoardConstants.goldCrayon2ndBoard;
        crayon2++;
        break;
      case 3:
        totalCount += BoardConstants.goldCrayon3rdBoard;
        crayon3++;
        break;
    }

    state = TotalGoldCrayonModel(
      totalCount: totalCount,
      countBoardNum1: crayon1,
      countBoardNum2: crayon2,
      countBoardNum3: crayon3,
    );
  }

  void subtract(int boardNumber) {
    int totalCount = state.totalCount;
    int crayon1 = state.countBoardNum1;
    int crayon2 = state.countBoardNum2;
    int crayon3 = state.countBoardNum3;

    switch(boardNumber) {
      case 1:
        totalCount -= BoardConstants.goldCrayon1stBoard;
        crayon1--;
        break;
      case 2:
        totalCount -= BoardConstants.goldCrayon2ndBoard;
        crayon2--;
        break;
      case 3:
        totalCount -= BoardConstants.goldCrayon3rdBoard;
        crayon3--;
        break;
    }

    state = TotalGoldCrayonModel(
      totalCount: totalCount,
      countBoardNum1: crayon1,
      countBoardNum2: crayon2,
      countBoardNum3: crayon3,
    );
  }
}

final totalGoldCrayonStateProvider = StateNotifierProvider<TotalGoldCrayonStateNotifier, TotalGoldCrayonModel>(
  (ref) => TotalGoldCrayonStateNotifier.initial(),
);