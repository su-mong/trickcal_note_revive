import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trickcal_note_revive/mixins/event_mixin.dart';
import 'package:trickcal_note_revive/providers/state/profile_character_state_provider.dart';
import 'package:trickcal_note_revive/widgets/base_button.dart';

class ProfileCharacterSelectionPopup extends ConsumerWidget with EventMixin {
  const ProfileCharacterSelectionPopup({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dialog(
      constraints: BoxConstraints(
        maxWidth: 408,
        maxHeight: 584,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              '프로필로 쓸 사진을 선택해주세요',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                child: Wrap(
                  spacing: 4,
                  runSpacing: 4,
                  children: ProfileCharacterConstants.profileImgList.map(
                    (profileImg) => BaseButton(
                      onTap: () {
                        ref.read(profileCharacterStateProvider.notifier).state = profileImg;
                        saveProfile(ref);
                        Navigator.pop(context);
                      },
                      child: CircleAvatar(
                        foregroundImage: AssetImage('assets/icons/$profileImg.png'),
                        radius: 20,
                      ),
                    ),
                  ).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}