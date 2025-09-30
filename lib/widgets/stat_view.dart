import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trickcal_note_revive/providers/state/total_gold_crayon_state_provider.dart';
import 'package:trickcal_note_revive/providers/state/total_stat_state_provider.dart';

import '../models/board_type.dart';

class StatView extends StatelessWidget {
  static const Color _color = Color(0xFFC0DC7F);

  const StatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      constraints: BoxConstraints(maxWidth: 500),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: _color),
      ),
      child: Column(
        spacing: 8,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _StatViewRowWidget(BoardType.hp, BoardType.attack),
          _StatViewRowWidget(BoardType.attack, BoardType.fatalBlow),
          _StatViewRowWidget(BoardType.fatalDamage, BoardType.fatalBlowDefense),
          _StatViewRowWidget(BoardType.fatalDamageDefense, BoardType.physicalDefense),
          _StatViewRowWidget(BoardType.magicalDefense, null, isEnd: true),
        ],
      ),
    );
  }
}

class _StatViewRowWidget extends ConsumerWidget {
  final BoardType firstType;
  final BoardType? secondType;
  final bool isEnd;
  const _StatViewRowWidget(
    this.firstType,
    this.secondType, {
    this.isEnd = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final firstTypeState = ref.watch(totalStatStateProvider(firstType));

    if(secondType == BoardType.attack) {
      final secondTypeState = ref.watch(totalStatStateProvider(secondType!));

      return Row(
        spacing: 16,
        children: [
          Expanded(
            child: _StatViewItemWidget(
              title: (firstType == BoardType.attack) ? '마법 공격력' : firstType.title,
              typeName: (firstType == BoardType.attack)
                  ? 'icon_magicalAttack'
                  : 'icon_${firstType.name}',
              stat: '${firstTypeState.stat}%',
              crayonCount1: firstTypeState.countCrayon1,
              crayonCount2: firstTypeState.countCrayon2,
              crayonCount3: firstTypeState.countCrayon3,
            ),
          ),
          Expanded(
            child: _StatViewItemWidget(
              title: '물리 공격력',
              typeName: 'icon_physicalAttack',
              stat: '${secondTypeState.stat}%',
              crayonCount1: secondTypeState.countCrayon1,
              crayonCount2: secondTypeState.countCrayon2,
              crayonCount3: secondTypeState.countCrayon3,
            ),
          ),
        ],
      );
    }

    if(isEnd) {
      final goldCrayonState = ref.watch(totalGoldCrayonStateProvider);

      return Row(
        spacing: 16,
        children: [
          Expanded(
            child: _StatViewItemWidget(
              title: (firstType == BoardType.attack) ? '마법 공격력' : firstType.title,
              typeName: (firstType == BoardType.attack)
                  ? 'icon_magicalAttack'
                  : 'icon_${firstType.name}',
              stat: '${firstTypeState.stat}%',
              crayonCount1: firstTypeState.countCrayon1,
              crayonCount2: firstTypeState.countCrayon2,
              crayonCount3: firstTypeState.countCrayon3,
            ),
          ),
          Expanded(
            child: _StatViewItemWidget(
              title: '사용 갯수',
              typeName: 'gold_crayon',
              stat: '${goldCrayonState.totalCount}개',
              crayonCount1: goldCrayonState.countBoardNum1,
              crayonCount2: goldCrayonState.countBoardNum2,
              crayonCount3: goldCrayonState.countBoardNum3,
            ),
          ),
        ],
      );
    }

    final secondTypeState = ref.watch(totalStatStateProvider(secondType!));
    return Row(
      spacing: 16,
      children: [
        Expanded(
          child: _StatViewItemWidget(
            title: (firstType == BoardType.attack) ? '마법 공격력' : firstType.title,
            typeName: (firstType == BoardType.attack)
                ? 'icon_magicalAttack'
                : 'icon_${firstType.name}',
            stat: '${firstTypeState.stat}%',
            crayonCount1: firstTypeState.countCrayon1,
            crayonCount2: firstTypeState.countCrayon2,
            crayonCount3: firstTypeState.countCrayon3,
          ),
        ),
        Expanded(
          child: _StatViewItemWidget(
            title: secondType!.title,
            typeName: 'icon_${secondType!.name}',
            stat: '${secondTypeState.stat}%',
            crayonCount1: secondTypeState.countCrayon1,
            crayonCount2: secondTypeState.countCrayon2,
            crayonCount3: secondTypeState.countCrayon3,
          ),
        ),
      ],
    );
  }
}

class _StatViewItemWidget extends StatelessWidget {
  static const Color _color = Color(0xFFC0DC7F);
  static const Color _subColor = Color(0xFFF6FDE7);
  static const Color _textColor = Color(0xFF315A19);

  final String title;
  final String typeName;
  final String stat;
  final int crayonCount1;
  final int crayonCount2;
  final int crayonCount3;

  const _StatViewItemWidget({
    required this.title,
    required this.typeName,
    required this.stat,
    required this.crayonCount1,
    required this.crayonCount2,
    required this.crayonCount3,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 4,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 40,
          decoration: BoxDecoration(
            color: _color,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              const SizedBox(width: 4),
              Image.asset(
                'assets/images/$typeName.png',
                height: 28,
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Container(
                  height: 36,
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    color: _subColor,
                    borderRadius: BorderRadius.horizontal(
                      right: Radius.circular(8),
                    ),
                  ),
                  child: Row(
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 16,
                          color: _textColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        stat,
                        style: TextStyle(
                          fontSize: 16,
                          color: _textColor,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 2),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 32),
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: _color,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('$crayonCount1'),
              Text('$crayonCount2'),
              Text('$crayonCount3'),
            ],
          ),
        ),
      ],
    );
  }
}