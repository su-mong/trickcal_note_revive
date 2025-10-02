import 'package:flutter_riverpod/legacy.dart';
import 'package:trickcal_note_revive/models/board_constants.dart';

import '../../models/board_state.dart';
import '../../models/board_type.dart';
import '../../models/character_board_model.dart';
import '../../models/character_state_model.dart';
import '../../models/character_type.dart';

class BoardDataStateNotifier extends StateNotifier<Map<BoardType, Map<CharacterType, List<CharacterStateModel>>>> {
  final int boardNum;

  BoardDataStateNotifier._(
    super.state, {
    required this.boardNum,
  });

  factory BoardDataStateNotifier.initial(int boardNum) {
    final data = (
      boardNum == 1
          ? BoardConstants.board1st
          : boardNum == 2
          ? BoardConstants.board2nd
          : BoardConstants.board3rd
    ).map(
      (key1, value1) => MapEntry(
        key1,
        value1.map(
          (key2, value2) => MapEntry(
            key2,
            value2.map(
              (character) => CharacterStateModel(
                character,
                BoardState.notHave,
              ),
            ).toList(),
          ),
        ),
      ),
    );

    return BoardDataStateNotifier._(data, boardNum: boardNum);
  }

  void loadFromJson(Map<String, dynamic> jsonMap) {
    final stateMap = <BoardType, Map<CharacterType, List<CharacterStateModel>>>{};

    jsonMap.forEach((boardTypeStr, innerMap) {
      final innerJsonMap = <CharacterType, List<CharacterStateModel>>{};

      final boardType = boardTypeStr.toBoardType;
      (innerMap as Map<String, dynamic>).forEach(
        (charTypeStr, charMapList) {
          final characterType = CharacterType.values.firstWhere((type) => type.code == charTypeStr);
          innerJsonMap[characterType] = (charMapList as List<dynamic>).map(
            (innerItem) => CharacterStateModel.fromJson(innerItem as Map<String, dynamic>),
          ).toList();
        }
      );

      stateMap[boardType] = innerJsonMap;
    });

    state = stateMap;
  }

  Map<String, dynamic> get toJson {
    final jsonMap = <String, dynamic>{};

    state.forEach((boardKey, innerMap) {
      final innerJsonMap = <String, dynamic>{};

      innerMap.forEach((charKey, charList) {
        final jsonList = charList.map((model) => model.toJsonShort()).toList();
        innerJsonMap[charKey.code] = jsonList;
      });

      jsonMap[boardKey.code] = innerJsonMap;
    });

    return jsonMap;
  }

  BoardState changeState({
    required BoardType boardType,
    required CharacterBoardModel characterBoard,
  }) {
    final characterStateModelIndex = state[boardType]![characterBoard.character.type]!.lastIndexWhere(
      ((characterState) => characterBoard == characterState.characterBoard),
    );
    final characterStateModel = state[boardType]![characterBoard.character.type]![characterStateModelIndex];

    late BoardState newState;

    if(characterStateModel.state == BoardState.notHave) {
      newState = BoardState.inactive;

      /// 해당 캐릭터를 찾고, 상태가 [inactive] -> [active]로 변경
      for(var boardIndex = 0; boardIndex < state.values.length; boardIndex++) {
        for(var characterStateIndex = 0; characterStateIndex < state.values.elementAt(boardIndex).length; characterStateIndex++) {
          final characterIndex = state.values.elementAt(boardIndex).values.elementAt(characterStateIndex).lastIndexWhere(
            (characterState) => characterBoard == characterState.characterBoard && BoardState.notHave == characterState.state,
          );
          if(characterIndex > -1) {
            state.values.elementAt(boardIndex).values.elementAt(characterStateIndex)[characterIndex] = CharacterStateModel(
              characterStateModel.characterBoard,
              newState,
            );
          }
        }
      }
    } else {
      if(characterStateModel.state == BoardState.inactive) {
        newState = BoardState.active;
      } else if(characterStateModel.state == BoardState.active) {
        newState = BoardState.inactive;
      }

      state[boardType]![characterBoard.character.type]![characterStateModelIndex] = CharacterStateModel(
        characterStateModel.characterBoard,
        newState,
      );
    }

    state = Map.from(state);
    return newState;
  }
}

/// 아래 provider는 notifier만 사용한다.
final board1stDataStateProvider = StateNotifierProvider<BoardDataStateNotifier, Map<BoardType, Map<CharacterType, List<CharacterStateModel>>>>(
  (ref) => BoardDataStateNotifier.initial(1),
);

final board2ndDataStateProvider = StateNotifierProvider<BoardDataStateNotifier, Map<BoardType, Map<CharacterType, List<CharacterStateModel>>>>(
  (ref) => BoardDataStateNotifier.initial(2),
);

final board3rdDataStateProvider = StateNotifierProvider<BoardDataStateNotifier, Map<BoardType, Map<CharacterType, List<CharacterStateModel>>>>(
  (ref) => BoardDataStateNotifier.initial(3),
);