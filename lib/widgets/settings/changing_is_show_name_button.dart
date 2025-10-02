import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/state/view_settings_state_provider.dart';

class ChangingIsShowNameButton extends ConsumerWidget {
  const ChangingIsShowNameButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isShowName = ref.watch(isShowNameProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Checkbox(
          value: isShowName,
          mouseCursor: SystemMouseCursors.click,
          onChanged: (bool? value) => ref.read(viewSettingsStateProvider.notifier).toggleIsShowName(),
        ),
        const SizedBox(width: 4),
        Text(
          '이름 표시하기',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}