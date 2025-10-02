import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trickcal_note_revive/widgets/base_button.dart';

import '../../models/board_type.dart';
import '../../providers/state/current_board_view_provider.dart';

class ActiveBoardTypeView extends ConsumerWidget {
  static const Color _color = Color(0xFFC0DC7F);

  const ActiveBoardTypeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeBoardTypeMap = ref.watch(currentBoardViewStateProvider);
    final boardViewStateNotifier = ref.read(currentBoardViewStateProvider.notifier);

    return Row(
      spacing: 4,
      mainAxisAlignment: MainAxisAlignment.center,
      children: BoardType.values.map(
            (boardType) {
          final isSelected = activeBoardTypeMap[boardType]!;

          return Expanded(
            child: BaseButton(
              onTap: () => boardViewStateNotifier.toggleBoardView(boardType),
              child: Container(
                padding: const EdgeInsets.all(2),
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isSelected ? _color : null,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Image.asset(
                  'assets/images/${boardType.name}.png',
                ),
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}