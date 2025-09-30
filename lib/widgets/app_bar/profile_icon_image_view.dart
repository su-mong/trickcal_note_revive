import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trickcal_note_revive/providers/state/profile_character_state_provider.dart';
import 'package:trickcal_note_revive/widgets/base_button.dart';
import 'package:trickcal_note_revive/widgets/profile_character_selection_popup.dart';

class ProfileIconImageView extends ConsumerWidget {
  const ProfileIconImageView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileImage = ref.watch(profileCharacterStateProvider);

    return BaseButton(
      onTap: () {
        showDialog(
          context: context,
          builder: (_) => const ProfileCharacterSelectionPopup(),
        );
      },
      child: CircleAvatar(
        backgroundImage: AssetImage(
          'assets/icons/$profileImage.png',
        ),
        radius: 20,
      ),
    );
  }
}