import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trickcal_note_revive/providers/state/current_board_number_state_provider.dart';
import 'package:trickcal_note_revive/providers/state/view_settings_state_provider.dart';

import '../providers/state/current_board_type_state_provider.dart';
import '../widgets/board_view.dart';

class BoardMainMobileView extends ConsumerWidget {
  const BoardMainMobileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isShowName = ref.watch(isShowNameProvider);
    final boardNumber = ref.watch(currentBoardNumberStateProvider);
    final currentBoardType = ref.watch(currentBoardTypeStateProvider);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: BoardView(
        isShowName: isShowName,
        boardNum: boardNumber,
        boardType: currentBoardType,
      ),
    );
  }
}