import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'base_button.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    final supabase = Supabase.instance.client;
    final isLogin = supabase.auth.currentUser != null;

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        BaseButton(
          onTap: () {},
          child: CircleAvatar(
            backgroundImage: AssetImage(
              'assets/images/icon_uros.webp',
            ),
            radius: 20,
          ),
        ),
        const SizedBox(width: 12),
        BaseButton(
          onTap: isLogin ? _saveDataTest : _signInWithGoogle,
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
              isLogin
                  ? supabase.auth.currentUser!.id
                  : '로그인하고 보드정보 저장하기',
            ),
          ),
        ),
        const SizedBox(width: 40),
      ],
    );
  }

  Future<void> _signInWithGoogle() async {
    final supabase = Supabase.instance.client;
    try {
      await supabase.auth.signInWithOAuth(
        OAuthProvider.google,
        redirectTo: 'http://localhost:56086/',
        authScreenLaunchMode: LaunchMode.platformDefault,
      );

      final userId = supabase.auth.currentUser?.id;

      if(userId != null) {
        supabase.from('board').insert({
          'user_id': userId,
          'data': 'SUCCEED',
        });
      }
    } catch (e) {
      // 에러 처리 (예: ScaffoldMessenger로 알림)
      print('Error: $e');
    }
  }

  Future<void> _saveDataTest() async {
    final supabase = Supabase.instance.client;

    final userId = supabase.auth.currentUser?.id;
    if(userId != null) {
      final result = await supabase.from('board').insert({
        'user_id': userId,
        'data': 'SUCCEED',
      });
      print(result.toString());
    } else {
      print('userID is NULL');
    }
  }
}