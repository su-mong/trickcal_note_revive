import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/state/view_settings_state_provider.dart';
import '../base_button.dart';

class ChangingIsShowNameButton extends ConsumerWidget {
  const ChangingIsShowNameButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isShowName = ref.watch(isShowNameProvider);

    return BaseButton(
      onTap: () {
        ref.read(viewSettingsStateProvider.notifier).toggleIsShowName();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 4,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black),
        ),
        child: Text(
          isShowName
              ? '이름 감추기'
              : '이름 표시하기',
        ),
      ),
    );
  }
}