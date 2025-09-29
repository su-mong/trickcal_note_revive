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

final boardTypeCurrentCountStateProvider = Provider.family<BoardTypeCurrentCountState, (int, BoardType)>(
  (ref, arguments) {
    final (int currentCount, int totalCount) = ref.watch(
      board1stDataStateProvider.select(
        (data) {
          int currentCount = 0;
          int totalCount = 0;
          for(var characterList in data[arguments.$2]!.values) {
            totalCount += characterList.length;
            for(var characterStateModel in characterList) {
              if(characterStateModel.state == BoardState.check) {
                currentCount++;
              }
            }
          }

          return (currentCount, totalCount);
        }
      ),
    );

    return BoardTypeCurrentCountState(
      currentCount: currentCount,
      totalCount: totalCount,
    );
  }
);