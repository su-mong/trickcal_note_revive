// Required imports
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:trickcal_note_revive/providers/state/profile_character_state_provider.dart';

import '../state/current_board_view_provider.dart';
import 'board_data_provider.dart';

// Provider definition
final serverDataProvider = FutureProvider<void>((ref) async {
  final SupabaseClient supabase = Supabase.instance.client;

  // Step 1: Check if logged in
  User? currentUser = supabase.auth.currentUser;
  if (currentUser == null) {
    try {
      await supabase.auth.signInAnonymously();
      currentUser = supabase.auth.currentUser;

      if(currentUser == null) {
        throw Exception('Anonymous sign-in failed: Unknown Error');
      }
    } catch (e) {
      throw Exception('Anonymous sign-in failed: $e');
    }
  }

  try {
    final data = await supabase
        .from('board')
        .select()
        .eq('user_id', currentUser.id);

    if (data.isNotEmpty) {
      ref.read(board1stDataStateProvider.notifier).loadFromJson(jsonDecode(data[0]['data']) as Map<String, dynamic>);
      // ref.read(board2ndDataStateProvider.notifier).loadFromJson(jsonDecode(data[0]['data'][1]) as Map<String, dynamic>);
      // ref.read(board3rdDataStateProvider.notifier).loadFromJson(jsonDecode(result['data'][2]) as Map<String, dynamic>);
      ref.read(currentBoardViewStateProvider.notifier).loadFromJson(data[0]['board_view_state']);
      ref.read(profileCharacterStateProvider.notifier).state = data[0]['icon'];
    }
  } catch (e) {
    throw Exception('Board query failed: $e');
  }
});