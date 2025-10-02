import 'package:flutter/material.dart';
import 'package:trickcal_note_revive/utils/responsive.dart';
import 'package:trickcal_note_revive/widgets/settings/changing_is_show_name_button.dart';
import 'package:trickcal_note_revive/widgets/app_bar/login_and_save_button.dart';
import 'package:trickcal_note_revive/widgets/app_bar/profile_icon_image_view.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.responsive<double>(16, tablet: 40, desktop: 40),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          const ProfileIconImageView(),
          const SizedBox(width: 12),
          const LoginAndSaveButton(),
        ],
      ),
    );
  }
}