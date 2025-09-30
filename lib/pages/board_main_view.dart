import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trickcal_note_revive/providers/state/view_settings_state_provider.dart';
import 'package:trickcal_note_revive/utils/responsive.dart';

import '../models/board_type.dart';
import '../providers/state/current_board_number_state_provider.dart';
import '../providers/state/current_board_view_provider.dart';
import '../widgets/board_row.dart';

class BoardMainView extends ConsumerWidget {
  const BoardMainView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final boardNumber = ref.watch(currentBoardNumberStateProvider);
    final activeBoardTypeMap = ref.watch(currentBoardViewStateProvider);

    final isShowName = ref.watch(isShowNameProvider);
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

    late final List<Widget> columnChildren;
    if(boardRowTypeList.isNotEmpty) {
      if(sizeBoardRow != 1 && boardRowTypeList.last.length == 1) {
        boardRowTypeList.last.add(null);
        if(sizeBoardRow == 3) {
          boardRowTypeList.last.add(null);
        }
      } else if(sizeBoardRow == 3 && boardRowTypeList.last.length == 2) {
        boardRowTypeList.last.add(null);
      }

      columnChildren = boardRowTypeList.map(
        (boardRowTypes) => BoardRow(
          boardNum: boardNumber,
          isShowName: isShowName,
          boardTypeList: boardRowTypes,
        ),
      ).toList();
    } else {
      columnChildren = [
        Container(
          height: 200,
          alignment: Alignment.center,
          child: Text(
            '대충 파묻혀있는 버터짤 들어갈 자리',
            style: TextStyle(
              fontSize: 20,
              color: Colors.red,
            ),
          ),
        ),
      ];
    }

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