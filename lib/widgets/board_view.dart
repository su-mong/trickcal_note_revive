import 'package:flutter/material.dart';

import '../models/board_constants.dart';
import '../models/board_type.dart';
import '../models/character_board_model.dart';
import '../models/character_type.dart';
import '../providers/state/board_view_item_state_provider.dart';
import 'board_title_view.dart';
import 'character_button/character_button.dart';

class BoardView extends StatelessWidget {
  final int boardNum;
  final bool isShowName;
  final BoardType boardType;

  const BoardView({
    super.key,
    required this.boardNum,
    required this.isShowName,
    required this.boardType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BoardTitleView(
            boardNum: boardNum,
            boardType: boardType,
          ),
          const SizedBox(height: 20),

          ...CharacterType.values.map(
            (characterType) {
              final characterModels = (
                  boardNum == 1
                      ? BoardConstants.board1st
                      : boardNum == 2
                      ? BoardConstants.board2nd
                      : BoardConstants.board3rd
              )[boardType]![characterType]!;

              if(characterModels.isEmpty) {
                return const SizedBox.shrink();
              }

              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/${characterType.name}.png',
                        height: 20,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        characterType.title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  ..._gridView(
                    characterModels,
                    characterType,
                    isShowName,
                  ),
                  const SizedBox(height: 16),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  List<Widget> _gridView(List<CharacterBoardModel> characterModels, CharacterType characterType, bool isShowName) {
    final rowItemCount = isShowName ? 4 : 5;

    final List<BoardViewItemStateArguments> items = characterModels.map(
      (character) => BoardViewItemStateArguments(
        boardNumber: boardNum,
        boardType: boardType,
        characterType: characterType,
        characterBoard: character,
      ),
    ).toList();

    final rowCount = (items.length / rowItemCount).ceil();
    final result = <Widget>[];

    for(var i=0; i<rowCount; i++) {
      final item0 = (i * rowItemCount) < items.length ? items[i * rowItemCount] : null;
      final item1 = (i * rowItemCount + 1) < items.length ? items[i * rowItemCount + 1] : null;
      final item2 = (i * rowItemCount + 2) < items.length ? items[i * rowItemCount + 2] : null;
      final item3 = (i * rowItemCount + 3) < items.length ? items[i * rowItemCount + 3] : null;

      BoardViewItemStateArguments? item4;
      if(isShowName == false) {
        item4 = (i * rowItemCount + 4) < items.length ? items[i * rowItemCount + 4] : null;
      }

      result.add(
        Row(
          spacing: 2,
          children: [
            _item(item0),
            _item(item1),
            _item(item2),
            _item(item3),
            if(isShowName == false)
              _item(item4),
          ],
        ),
      );
      result.add(
        const SizedBox(height: 4),
      );
    }

    return result;
  }

  Widget _item(BoardViewItemStateArguments? arguments) {
    if(arguments == null) {
      return const Spacer();
    }

    return Expanded(
      child: CharacterButton(arguments),
    );
  }
}