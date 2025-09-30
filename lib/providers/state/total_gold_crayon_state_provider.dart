import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trickcal_note_revive/models/board_constants.dart';
import 'package:trickcal_note_revive/models/board_type.dart';

import '../../models/board_state.dart';
import '../data/board_data_provider.dart';

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

final totalGoldCrayonStateProvider = Provider<TotalGoldCrayonModel>(
  (ref) {
    final countBoardNum1 = ref.watch(
      board1stDataStateProvider.select(
        (data) {
          int result = 0;
          for(var boardType in BoardType.values) {
            for(var characterList in data[boardType]!.values) {
              for(var characterStateModel in characterList) {
                if(characterStateModel.state == BoardState.active) {
                  result += BoardConstants.goldCrayon1stBoard;
                }
              }
            }
          }

          return result;
        },
      ),
    );

    final countBoardNum2 = ref.watch(
      board2ndDataStateProvider.select(
        (data) {
          int result = 0;
          for(var boardType in BoardType.values) {
            for(var characterList in data[boardType]!.values) {
              for(var characterStateModel in characterList) {
                if(characterStateModel.state == BoardState.active) {
                  result += BoardConstants.goldCrayon2ndBoard;
                }
              }
            }
          }

          return result;
        },
      ),
    );

    final countBoardNum3 = ref.watch(
      board3rdDataStateProvider.select(
            (data) {
          int result = 0;
          for(var boardType in BoardType.values) {
            for(var characterList in data[boardType]!.values) {
              for(var characterStateModel in characterList) {
                if(characterStateModel.state == BoardState.active) {
                  result += BoardConstants.goldCrayon3rdBoard;
                }
              }
            }
          }

          return result;
        },
      ),
    );

    return TotalGoldCrayonModel(
      totalCount: countBoardNum1 + countBoardNum2 + countBoardNum3,
      countBoardNum1: countBoardNum1,
      countBoardNum2: countBoardNum2,
      countBoardNum3: countBoardNum3,
    );
  },
);