import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/board_state.dart';
import '../../models/board_type.dart';
import '../data/board_data_provider.dart';

class BoardTypeCurrentCountState {
  final int currentCount;
  final int totalCount;

  const BoardTypeCurrentCountState({
    required this.currentCount,
    required this.totalCount,
  });
}

final board1stTypeCurrentCountStateProvider = Provider.family<BoardTypeCurrentCountState, BoardType>(
  (ref, boardType) {
    final (int currentCount, int totalCount) = ref.watch(
      board1stDataStateProvider.select(
        (data) {
          int currentCount = 0;
          int totalCount = 0;
          for(var characterList in data[boardType]!.values) {
            totalCount += characterList.length;
            for(var characterStateModel in characterList) {
              if(characterStateModel.state == BoardState.active) {
                currentCount++;
              }
            }
          }

          return (currentCount, totalCount);
        },
      ),
    );

    return BoardTypeCurrentCountState(
      currentCount: currentCount,
      totalCount: totalCount,
    );
  }
);

final board2ndTypeCurrentCountStateProvider = Provider.family<BoardTypeCurrentCountState, BoardType>(
  (ref, boardType) {
    final (int currentCount, int totalCount) = ref.watch(
      board2ndDataStateProvider.select(
        (data) {
          int currentCount = 0;
          int totalCount = 0;
          for(var characterList in data[boardType]!.values) {
            totalCount += characterList.length;
            for(var characterStateModel in characterList) {
              if(characterStateModel.state == BoardState.active) {
                currentCount++;
              }
            }
          }

          return (currentCount, totalCount);
        },
      ),
    );

    return BoardTypeCurrentCountState(
      currentCount: currentCount,
      totalCount: totalCount,
    );
  },
);

final board3rdTypeCurrentCountStateProvider = Provider.family<BoardTypeCurrentCountState, BoardType>(
  (ref, boardType) {
    final (int currentCount, int totalCount) = ref.watch(
      board3rdDataStateProvider.select(
        (data) {
          int currentCount = 0;
          int totalCount = 0;
          for(var characterList in data[boardType]!.values) {
            totalCount += characterList.length;
            for(var characterStateModel in characterList) {
              if(characterStateModel.state == BoardState.active) {
                currentCount++;
              }
            }
          }

          return (currentCount, totalCount);
        },
      ),
    );

    return BoardTypeCurrentCountState(
      currentCount: currentCount,
      totalCount: totalCount,
    );
  },
);