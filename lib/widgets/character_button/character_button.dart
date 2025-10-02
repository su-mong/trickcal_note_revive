import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../mixins/event_mixin.dart';
import '../../models/board_state.dart';
import '../../providers/state/board_view_item_state_provider.dart';
import '../../providers/state/view_settings_state_provider.dart';
import '../base_button.dart';
import 'crayon_row.dart';

class CharacterButton extends ConsumerWidget with EventMixin {
  final BoardViewItemStateArguments arguments;

  const CharacterButton(
    this.arguments, {
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentState = ref.watch(
      boardViewItemStateProvider(arguments),
    );
    final isShowName = ref.watch(isShowNameProvider);

    return BaseButton(
      onTap: () => clickCharacter(ref, arguments),
      child: Stack(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                color: currentState == BoardState.notHave
                    ? Colors.grey
                    : arguments.characterBoard.character.type.secondaryColor,
                borderRadius: BorderRadius.circular(8),
              ),
              alignment: Alignment.center,
              child: Container(
                margin: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: currentState == BoardState.notHave
                      ? Colors.grey
                      : arguments.characterBoard.character.type.color,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: currentState == BoardState.notHave
                          ? const Color(0xFF757575)
                          : const Color(0xFFBBBBBB),
                      offset: const Offset(1, 3),
                      blurRadius: 0,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Image.asset(
                  'assets/sados/${arguments.characterBoard.character.engName}.png',
                  color: currentState == BoardState.notHave
                      ? Colors.grey
                      : null,
                  colorBlendMode: currentState == BoardState.notHave
                      ? BlendMode.saturation
                      : null,
                ),
              ),
            ),
          ),

          Positioned(
            top: 2,
            left: 2,
            right: 0,
            child: CrayonRow(
              gold: arguments.characterBoard.goldCrayon,
              purple: arguments.characterBoard.purpleCrayon,
            ),
          ),

          if(isShowName)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(8),
                  ),
                ),
                child: Text(
                  arguments.characterBoard.character.name,
                  style: TextStyle(
                    color: currentState == BoardState.notHave
                        ? Colors.grey
                        : Colors.black,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),

          if(currentState == BoardState.active)
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0x52000000),
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/images/check.png',
                  height: 28,
                ),
              ),
            ),
        ],
      ),
    );
  }
}