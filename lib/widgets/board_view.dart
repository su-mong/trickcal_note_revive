import 'package:flutter/material.dart';

import '../models/board_constants.dart';
import '../models/board_type.dart';
import '../models/character_type.dart';
import '../providers/state/board_view_item_state_provider.dart';
import 'board_title_view.dart';
import 'character_button.dart';

class BoardView extends StatelessWidget {
  final BoardType boardType;

  const BoardView({
    super.key,
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
            boardNum: 1,
            boardType: boardType,
          ),
          const SizedBox(height: 20),

          ...CharacterType.values.map(
            (characterType) => Column(
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
                ..._gridView(characterType),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _gridView(CharacterType characterType) {
    final List<BoardViewItemStateArguments> items = BoardConstants.board1st[boardType]![characterType]!.map(
      (character) => BoardViewItemStateArguments(
        boardNumber: 1,
        boardType: boardType,
        characterType: characterType,
        character: character
      ),
    ).toList();

    final rowCount = (items.length / 5).ceil();
    final result = <Widget>[];

    for(var i=0; i<rowCount; i++) {
      final item0 = (i * 5) < items.length ? items[i * 5] : null;
      final item1 = (i * 5 + 1) < items.length ? items[i * 5 + 1] : null;
      final item2 = (i * 5 + 2) < items.length ? items[i * 5 + 2] : null;
      final item3 = (i * 5 + 3) < items.length ? items[i * 5 + 3] : null;
      final item4 = (i * 5 + 4) < items.length ? items[i * 5 + 4] : null;

      result.add(
        Row(
          children: [
            _item(item0),
            _item(item1),
            _item(item2),
            _item(item3),
            _item(item4),
          ],
        ),
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