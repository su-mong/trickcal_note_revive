import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trickcal_note_revive/providers/data/board_data_provider.dart';

import '../../models/board_state.dart';
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

final totalStatStateProvider = Provider.family<TotalStatModel, BoardType>(
  (ref, boardType) {
    final (int statCrayon1, int countCrayon1) = ref.watch(
      board1stDataStateProvider.select(
        (data) {
          int statCrayon1 = 0;
          int countCrayon1 = 0;
          for(var characterList in data[boardType]!.values) {
            for(var characterStateModel in characterList) {
              if(characterStateModel.state == BoardState.active) {
                statCrayon1 += boardType.increment;
                countCrayon1++;
              }
            }
          }

          return (statCrayon1, countCrayon1);
        },
      ),
    );

    final (int statCrayon2, int countCrayon2) = ref.watch(
      board2ndDataStateProvider.select(
        (data) {
          int statCrayon2 = 0;
          int countCrayon2 = 0;
          for(var characterList in data[boardType]!.values) {
            for(var characterStateModel in characterList) {
              if(characterStateModel.state == BoardState.active) {
                statCrayon2 += boardType.increment;
                countCrayon2++;
              }
            }
          }

          return (statCrayon2, countCrayon2);
        },
      ),
    );

    final (int statCrayon3, int countCrayon3) = ref.watch(
      board3rdDataStateProvider.select(
        (data) {
          int statCrayon3 = 0;
          int countCrayon3 = 0;
          for(var characterList in data[boardType]!.values) {
            for(var characterStateModel in characterList) {
              if(characterStateModel.state == BoardState.active) {
                statCrayon3 += boardType.increment;
                countCrayon3++;
              }
            }
          }

          return (statCrayon3, countCrayon3);
        },
      ),
    );

    return TotalStatModel(
      stat: statCrayon1 + statCrayon2 + statCrayon3,
      countCrayon1: countCrayon1,
      countCrayon2: countCrayon2,
      countCrayon3: countCrayon3,
    );
  },
);