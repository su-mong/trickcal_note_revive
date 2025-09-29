import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trickcal_note_revive/utils/responsive.dart';

import '../models/board_type.dart';
import '../providers/state/current_board_view_provider.dart';
import '../widgets/board_row.dart';

class BoardMainView extends ConsumerWidget {
  const BoardMainView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeBoardTypeMap = ref.watch(currentBoardViewStateProvider);
    final sizeBoardRow = context.responsive<int>(1, tablet: 2, desktop: 3);

    final List<List<BoardType?>> boardRowTypeList = [];
    int columnIndex = 0;
    int rowIndex = 0;
    for(var boardType in BoardType.values) {
      if(activeBoardTypeMap[boardType] == true) {
        if(rowIndex == 0) {
          boardRowTypeList.add([boardType]);
          rowIndex++;
        } else if(rowIndex == sizeBoardRow) {
          columnIndex++;
          boardRowTypeList.add([boardType]);
          rowIndex = 1;
        } else {
          boardRowTypeList[columnIndex].add(boardType);
          rowIndex++;
        }
      }
    }

    if(sizeBoardRow != 1 && boardRowTypeList.last.length == 1) {
      boardRowTypeList.last.add(null);
      if(sizeBoardRow == 3) {
        boardRowTypeList.last.add(null);
      }
    } else if(sizeBoardRow == 3 && boardRowTypeList.last.length == 2) {
      boardRowTypeList.last.add(null);
    }

    final columnChildren = boardRowTypeList.map(
      (boardRowTypes) => BoardRow(
        boardTypeList: boardRowTypes,
      ),
    ).toList();

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.responsive<double>(16, tablet: 20, desktop: 24),
      ),
      child: Column(
        spacing: context.responsive<double>(16, tablet: 24, desktop: 32),
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: columnChildren,
      ),
    );
  }
}