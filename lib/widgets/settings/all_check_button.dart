import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trickcal_note_revive/mixins/event_mixin.dart';
import 'package:trickcal_note_revive/providers/state/current_board_number_state_provider.dart';

import '../base_button.dart';

class AllCheckButton extends ConsumerStatefulWidget {
  const AllCheckButton({super.key});

  @override
  ConsumerState<AllCheckButton> createState() => _AllCheckButtonState();
}

class _AllCheckButtonState extends ConsumerState<AllCheckButton> with EventMixin {
  bool _isAllChecked = false;

  @override
  Widget build(BuildContext context) {
    final currentBoardNumber = ref.watch(currentBoardNumberStateProvider);

    return BaseButton(
      onTap: () {
        setState(() {
          _isAllChecked = !_isAllChecked;
        });
        changeAllCurrentBoard(ref, currentBoardNumber, changeToActive: _isAllChecked);
      },
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black),
        ),
        child: Text(
          _isAllChecked
              ? '$currentBoardNumber차 보드 전부 지우기'
              : '$currentBoardNumber차 보드 전부 칠하기',
        ),
      ),
    );
  }
}