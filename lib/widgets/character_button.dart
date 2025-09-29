import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../mixins/event_mixin.dart';
import '../models/board_state.dart';
import '../providers/state/board_view_item_state_provider.dart';
import 'base_button.dart';

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

    return BaseButton(
      onTap: () => clickCharacter(
        ref,
        arguments,
        currentState,
      ),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            color: switch(currentState) {
              BoardState.inactive => Colors.black38,
              BoardState.active => arguments.character.type.color,
              BoardState.check => arguments.character.type.color,
            },
            alignment: Alignment.center,
            child: Image.asset(
              'assets/images/${arguments.character.engName}.webp',
              color: currentState == BoardState.inactive
                  ? Colors.grey
                  : null,
              colorBlendMode: currentState == BoardState.inactive
                  ? BlendMode.saturation
                  : null,
            ),
          ),

          if(currentState == BoardState.check)
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                color: Color(0x52000000),
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