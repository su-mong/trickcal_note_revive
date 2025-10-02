import 'package:flutter/material.dart';
import 'package:trickcal_note_revive/widgets/current_view/board_number_toggle_view.dart';
import 'package:trickcal_note_revive/widgets/current_view/current_board_type_toggle_view.dart';

class BoardNumberAndTypeToggleView extends StatelessWidget {
  static const Color _color = Color(0xFFC0DC7F);

  final bool isMobile;

  const BoardNumberAndTypeToggleView({
    super.key,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    if(isMobile) {
      return Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          border: Border.all(color: _color),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            BoardNumberToggleView(showBorder: false),
            Divider(color: _color),
            CurrentBoardTypeToggleView(),
          ],
        ),
      );
    }

    return const BoardNumberToggleView();
  }
}