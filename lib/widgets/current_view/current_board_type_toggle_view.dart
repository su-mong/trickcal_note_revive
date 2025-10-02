import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trickcal_note_revive/models/board_type.dart';
import 'package:trickcal_note_revive/providers/state/current_board_type_state_provider.dart';

import '../../providers/state/current_board_view_provider.dart';
import '../base_button.dart';

class CurrentBoardTypeToggleView extends ConsumerWidget {
  const CurrentBoardTypeToggleView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeBoardTypeMap = ref.watch(currentBoardViewStateProvider);
    final currentBoardType = ref.watch(currentBoardTypeStateProvider);
    final notifier = ref.read(currentBoardTypeStateProvider.notifier);

    return Row(
      children: BoardType.values.map(
        (boardType) => Expanded(
          child: _BoardTypeButton(
            boardType,
            enabled: activeBoardTypeMap[boardType]!,
            isSelected: currentBoardType == boardType,
            onTap: () {
              if(currentBoardType != boardType) {
                notifier.state = boardType;
              }
            },
          ),
        ),
      ).toList(),
    );
  }
}

class _BoardTypeButton extends StatelessWidget {
  static const Color _color = Color(0xFFC0DC7F);

  final BoardType boardType;
  final bool enabled;
  final bool isSelected;
  final VoidCallback onTap;

  const _BoardTypeButton(
    this.boardType, {
    required this.enabled,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BaseButton(
      onTap: () {
        if(enabled) {
          onTap();
        }
      },
      child: Container(
        height: 40,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: isSelected ? _color : null,
          borderRadius: BorderRadius.circular(4),
        ),
        alignment: Alignment.center,
        child: Image.asset(
          'assets/images/${boardType.name}.png',
          color: enabled == false
              ? Colors.grey
              : null,
          colorBlendMode: enabled == false
              ? BlendMode.saturation
              : null,
        ),
      ),
    );
  }
}