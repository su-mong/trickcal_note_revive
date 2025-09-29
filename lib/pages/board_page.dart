import 'dart:async';

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:trickcal_note_revive/widgets/login_button.dart';

import '../widgets/active_board_type_view.dart';
import '../widgets/board_number_toggle_view.dart';
import '../widgets/stat_view.dart';
import 'board_main_view.dart';

class BoardPage extends StatefulWidget {
  const BoardPage({super.key});

  @override
  State<BoardPage> createState() => _BoardPageState();
}

class _BoardPageState extends State<BoardPage> {
  // late StreamSubscription<AuthState> _authSubscription;  // 인증 상태 리스너

  @override
  void initState() {
    super.initState();
    // // 인증 상태 변화 리스닝: 로그인 성공 시 홈으로 이동
    // _authSubscription = Supabase.instance.client.auth.onAuthStateChange.listen((data) {
    //   final event = data.event;
    //   if (event == AuthChangeEvent.signedIn) {
    //     // 로그인 성공: 원래 화면(홈)으로 이동 (pushReplacementNamed 또는 pop 사용)
    //     Navigator.of(context).pushReplacementNamed('/');  // '/home'은 앱의 홈 라우트로 변경
    //     // 또는 Navigator.pop(context); // 로그인 페이지 pop만 할 경우
    //   }
    // });
  }

  @override
  void dispose() {
    // _authSubscription.cancel();  // 리스너 해제
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            spacing: 16,
            mainAxisSize: MainAxisSize.min,
            children: [
              const LoginButton(),
              const ActiveBoardTypeView(),
              const StatView(),
              const SizedBox(height: 8),
              const BoardNumberToggleView(),
              const SizedBox(height: 12),
              const BoardMainView(),
            ],
          ),
        ),
      ),
    );
  }
}