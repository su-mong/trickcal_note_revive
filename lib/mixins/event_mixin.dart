import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/board_state.dart';
import '../providers/data/board_data_provider.dart';
import '../providers/state/board_view_item_state_provider.dart';
import '../providers/state/total_gold_crayon_state_provider.dart';
import '../providers/state/total_stat_state_provider.dart';

mixin EventMixin {
  void clickCharacter(WidgetRef ref, BoardViewItemStateArguments arguments, BoardState beforeState) {
    final boardViewItemStateNotifier = ref.read(board1stDataStateProvider.notifier);
    final totalStatStateNotifier = ref.read(totalStatStateProvider(arguments.boardType).notifier);
    final crayonNotifier = ref.read(totalGoldCrayonStateProvider.notifier);

    final currentState = boardViewItemStateNotifier.changeState(
      boardType: arguments.boardType,
      character: arguments.character,
    );

    /// 체크 상태가 아니었는데 체크로 변경 시
    if(beforeState != BoardState.check && currentState == BoardState.check) {
      totalStatStateNotifier.addStat(arguments.boardNumber);
      crayonNotifier.add(arguments.boardNumber);
    }
    /// 체크 상태에서 체크가 아닌 상태로 변경 시
    else if(beforeState == BoardState.check && currentState != BoardState.check) {
      totalStatStateNotifier.subtractStat(arguments.boardNumber);
      crayonNotifier.subtract(arguments.boardNumber);
    }
  }
}