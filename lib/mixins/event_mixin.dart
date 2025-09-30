import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:trickcal_note_revive/providers/state/profile_character_state_provider.dart';

import '../providers/data/board_data_provider.dart';
import '../providers/state/board_view_item_state_provider.dart';
import '../providers/state/current_board_view_provider.dart';

mixin EventMixin {
  static const String _tableName = 'board';

  void clickCharacter(WidgetRef ref, BoardViewItemStateArguments arguments) {
    late final BoardDataStateNotifier boardViewItemStateNotifier;
    switch(arguments.boardNumber) {
      case 1:
        boardViewItemStateNotifier = ref.read(board1stDataStateProvider.notifier);
        break;
      case 2:
        boardViewItemStateNotifier = ref.read(board2ndDataStateProvider.notifier);
        break;
      default:
        boardViewItemStateNotifier = ref.read(board3rdDataStateProvider.notifier);
        break;
    }

    boardViewItemStateNotifier.changeState(
      boardType: arguments.boardType,
      character: arguments.character,
    );
  }

  Future<String> saveAll(WidgetRef ref) async {
    final board1stDataJson = ref.read(board1stDataStateProvider.notifier).toJson;
    final board2ndDataJson = ref.read(board2ndDataStateProvider.notifier).toJson;
    final board3rdDataJson = ref.read(board3rdDataStateProvider.notifier).toJson;
    final currentBoardViewStateJson = ref.read(currentBoardViewStateProvider.notifier).toJson;

    try {
      // 1. 로그인 여부 확인
      final user = Supabase.instance.client.auth.currentUser;
      if (user == null) {
        return 'not login';
      }

      // 2. 데이터베이스에 데이터 삽입 (테이블 이름은 'your_table'로 가정; 실제 테이블 이름으로 변경하세요)
      final response = await Supabase.instance.client
          .from(_tableName)
          .upsert({
            'user_id': user.id,
            'data': [board1stDataJson, board2ndDataJson],
            'board_view_state': currentBoardViewStateJson,
          }, onConflict: 'user_id').select();

      // 3. 삽입 성공 여부 확인
      if (response.isEmpty) {
        return 'failed';
      }

      return 'succeed';
    } catch (e) {
      // 예외 발생 시 실패
      return 'failed: $e';
    }
  }

  Future<void> saveProfile(WidgetRef ref) async {
    final user = Supabase.instance.client.auth.currentUser;
    if (user == null) {
      return;
    }

    final icon = ref.read(profileCharacterStateProvider);
    await Supabase.instance.client
        .from(_tableName)
        .update({'icon': icon})
        .eq('user_id', user.id);
  }

  Future<void> saveBoardViewState(WidgetRef ref) async {
    final user = Supabase.instance.client.auth.currentUser;
    if (user == null) {
      return;
    }

    final currentBoardViewStateJson = ref.read(currentBoardViewStateProvider.notifier).toJson;
    await Supabase.instance.client
        .from(_tableName)
        .update({'board_view_state': currentBoardViewStateJson})
        .eq('user_id', user.id);
  }
}