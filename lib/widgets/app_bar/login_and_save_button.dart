import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:trickcal_note_revive/providers/state/loading_state_provider.dart';

import '../../providers/data/board_data_provider.dart';
import '../../providers/state/current_board_view_provider.dart';
import '../base_button.dart';

class LoginAndSaveButton extends ConsumerWidget {
  const LoginAndSaveButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final supabase = Supabase.instance.client;
    final isLogin = supabase.auth.currentUser != null && supabase.auth.currentUser!.isAnonymous == false;
    final isLoading = ref.watch(loadingStateProvider);

    return BaseButton(
      onTap: () {
        if(isLoading) return;

        if(isLogin) {
          _readDataTest(ref);
        } else {
          _signInWithGoogle(ref);
        }
      },
      child: Container(
        width: 80,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black),
        ),
        child: isLoading
            ? SizedBox(
          width: 20,
          height: 20,
          child: const CircularProgressIndicator(strokeWidth: 3),
        ) : Text(
          isLogin
              ? '저장하기'
              : '로그인',
        ),
      ),
    );
  }

  Future<void> _signInWithGoogle(WidgetRef ref) async {
    final supabase = Supabase.instance.client;
    try {
      await supabase.auth.signInWithOAuth(
        OAuthProvider.google,
        redirectTo: 'http://localhost:63877/',
        authScreenLaunchMode: LaunchMode.platformDefault,
      );
    } catch (e) {
      // 에러 처리 (예: ScaffoldMessenger로 알림)
      print('Error: $e');
    }
  }

  Future<void> _readDataTest(WidgetRef ref) async {
    final supabase = Supabase.instance.client;

    final userId = supabase.auth.currentUser?.id;
    if(userId != null) {
      final result = await supabase.from('board').select('data, board_view_state').eq('user_id', userId).single();
      ref.read(board1stDataStateProvider.notifier).loadFromJson(jsonDecode(result['data'][0]) as Map<String, dynamic>);
      ref.read(board2ndDataStateProvider.notifier).loadFromJson(jsonDecode(result['data'][1]) as Map<String, dynamic>);
      // ref.read(board3rdDataStateProvider.notifier).loadFromJson(jsonDecode(result['data'][2]) as Map<String, dynamic>);
      ref.read(currentBoardViewStateProvider.notifier).loadFromJson(result['board_view_state']);
    } else {
      print('userID is NULL');
    }
  }
}