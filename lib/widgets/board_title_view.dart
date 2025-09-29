import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/board_type.dart';
import '../providers/state/board_type_current_count_state_provider.dart';

class BoardTitleView extends ConsumerWidget {
  final int boardNum;
  final BoardType boardType;
  const BoardTitleView({
    super.key,
    required this.boardNum,
    required this.boardType,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentCountState = ref.watch(boardTypeCurrentCountStateProvider((boardNum, boardType)));

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/${boardType.name}.png',
          height: 28,
        ),
        const SizedBox(width: 4),
        Text(
          boardType.title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        const Spacer(),
        Text.rich(
          TextSpan(
            text: '${currentCountState.currentCount}',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
            children: [
              TextSpan(
                text: ' /${currentCountState.totalCount}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}