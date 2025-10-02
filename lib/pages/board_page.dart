import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trickcal_note_revive/mixins/event_mixin.dart';
import 'package:trickcal_note_revive/widgets/current_view/board_number_and_type_toggle_view.dart';
import 'package:trickcal_note_revive/providers/data/server_data_provider.dart';
import 'package:trickcal_note_revive/utils/responsive.dart';
import 'package:trickcal_note_revive/widgets/app_bar/app_bar.dart';
import 'package:trickcal_note_revive/widgets/settings/settings_view.dart';

import '../widgets/stat_view.dart';
import 'board_main_mobile_view.dart';
import 'board_main_view.dart';

class BoardPage extends ConsumerWidget with EventMixin {
  const BoardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final serverData = ref.watch(serverDataProvider);
    final isMobile = context.responsive(true, tablet: false, desktop: false);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: serverData.when(
          data: (_) {
            return SingleChildScrollView(
              child: Column(
                spacing: context.responsive(8, tablet: 16, desktop: 16),
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CustomAppBar(),
                  const SettingsView(),
                  const StatView(),
                  const SizedBox(height: 8),
                  BoardNumberAndTypeToggleView(isMobile: isMobile),
                  const SizedBox(height: 12),

                  isMobile
                      ? const BoardMainMobileView()
                      : const BoardMainView(),
                ],
              ),
            );
          },
          error: (Object error, StackTrace stackTrace) {
            return Center(
              child: Text(
                '오류가 발생했습니다 : $error',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                ),
              ),
            );
          },
          loading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}