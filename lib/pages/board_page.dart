import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trickcal_note_revive/mixins/event_mixin.dart';
import 'package:trickcal_note_revive/providers/data/server_data_provider.dart';
import 'package:trickcal_note_revive/widgets/app_bar/app_bar.dart';

import '../widgets/active_board_type_view.dart';
import '../widgets/board_number_toggle_view.dart';
import '../widgets/stat_view.dart';
import 'board_main_view.dart';

class BoardPage extends ConsumerWidget with EventMixin {
  const BoardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final serverData = ref.watch(serverDataProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: serverData.when(
          data: (_) {
            return SingleChildScrollView(
              child: Column(
                spacing: 16,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CustomAppBar(),
                  const ActiveBoardTypeView(),
                  const StatView(),
                  const SizedBox(height: 8),
                  const BoardNumberToggleView(),
                  const SizedBox(height: 12),
                  const BoardMainView(),
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