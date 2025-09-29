import 'package:flutter_riverpod/legacy.dart';
import 'package:trickcal_note_revive/models/board_constants.dart';

import '../../models/board_state.dart';
import '../../models/board_type.dart';
import '../../models/character_type.dart';
import '../../models/character_model.dart';

class CharacterStateModel {
  final CharacterModel character;
  final BoardState state;

  CharacterStateModel(
    this.character,
    this.state,
  );
}

class Board1stDataStateNotifier extends StateNotifier<Map<BoardType, Map<CharacterType, List<CharacterStateModel>>>> {
  Board1stDataStateNotifier._(super.state);

  factory Board1stDataStateNotifier.initial() {
    final data = BoardConstants.board1st.map(
      (key1, value1) => MapEntry(
        key1,
        value1.map(
          (key2, value2) => MapEntry(
            key2,
            value2.map(
              (character) => CharacterStateModel(
                character,
                BoardState.inactive,
              ),
            ).toList(),
          ),
        ),
      ),
    );

    return Board1stDataStateNotifier._(data);
  }

  BoardState changeState({
    required BoardType boardType,
    required CharacterModel character,
  }) {
    final characterStateModelIndex = state[boardType]![character.type]!.lastIndexWhere(
      ((characterState) => character == characterState.character),
    );
    final characterStateModel = state[boardType]![character.type]![characterStateModelIndex];

    late BoardState newState;

    if(characterStateModel.state == BoardState.inactive) {
      newState = BoardState.active;

      /// 해당 캐릭터를 찾고, 상태가 [inactive] -> [active]로 변경
      for(var boardIndex = 0; boardIndex < state.values.length; boardIndex++) {
        for(var characterStateIndex = 0; characterStateIndex < state.values.elementAt(boardIndex).length; characterStateIndex++) {
          final characterIndex = state.values.elementAt(boardIndex).values.elementAt(characterStateIndex).lastIndexWhere(
            (characterState) => character == characterState.character && BoardState.inactive == characterState.state,
          );
          if(characterIndex > -1) {
            state.values.elementAt(boardIndex).values.elementAt(characterStateIndex)[characterIndex] = CharacterStateModel(
              characterStateModel.character,
              newState,
            );
          }
        }
      }
    } else {
      if(characterStateModel.state == BoardState.active) {
        newState = BoardState.check;
      } else if(characterStateModel.state == BoardState.check) {
        newState = BoardState.active;
      }

      state[boardType]![character.type]![characterStateModelIndex] = CharacterStateModel(
        characterStateModel.character,
        newState,
      );
    }

    state = Map.from(state);
    return newState;
  }
}

/// 아래 provider는 notifier만 사용한다.
final board1stDataStateProvider = StateNotifierProvider<Board1stDataStateNotifier, Map<BoardType, Map<CharacterType, List<CharacterStateModel>>>>(
  (ref) => Board1stDataStateNotifier.initial(),
);