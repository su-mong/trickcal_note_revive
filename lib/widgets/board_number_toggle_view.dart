import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trickcal_note_revive/widgets/base_button.dart';

import '../providers/state/current_board_number_state_provider.dart';

class BoardNumberToggleView extends ConsumerWidget {
  static const Color _color = Color(0xFFC0DC7F);

  const BoardNumberToggleView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentBoardNumber = ref.watch(currentBoardNumberStateProvider);
    final notifier = ref.read(currentBoardNumberStateProvider.notifier);

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(color: _color),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          Expanded(
            child: _BoardNumberButton(
              1,
              isSelected: currentBoardNumber == 1,
              onTap: () => notifier.state = 1,
            ),
          ),
          Expanded(
            child: _BoardNumberButton(
              2,
              isSelected: currentBoardNumber == 2,
              onTap: () => notifier.state = 2,
            ),
          ),
          Expanded(
            child: _BoardNumberButton(
              3,
              isSelected: currentBoardNumber == 3,
              onTap: () => notifier.state = 3,
            ),
          ),
        ],
      ),
    );
  }
}

class _BoardNumberButton extends StatelessWidget {
  static const Color _color = Color(0xFFC0DC7F);

  final int number;
  final bool isSelected;
  final VoidCallback onTap;

  const _BoardNumberButton(
    this.number, {
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BaseButton(
      onTap: onTap,
      child: Container(
        height: 28,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: isSelected ? _color : null,
          borderRadius: BorderRadius.circular(4),
        ),
        alignment: Alignment.center,
        child: Text(
          '$number차 보드',
          style: TextStyle(
            fontWeight: isSelected
                ? FontWeight.w700
                : FontWeight.w400,
          ),
        ),
      ),
    );
  }
}