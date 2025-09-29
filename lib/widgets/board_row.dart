import 'package:flutter/material.dart';

import '../models/board_type.dart';
import 'board_view.dart';

class BoardRow extends StatelessWidget {
  final List<BoardType?> boardTypeList;

  const BoardRow({
    required this.boardTypeList,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: Row(
        spacing: 12,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: boardTypeList.map(
              (boardType) {
            if(boardType == null) {
              return const Spacer();
            }

            return Expanded(
              child: BoardView(
                boardType: boardType,
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}