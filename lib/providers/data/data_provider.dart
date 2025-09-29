import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final dataProvider = FutureProvider<Map<String, dynamic>>((ref) async {
  final userId = Supabase.instance.client.auth.currentUser?.id;
  if (userId == null) {
    return {};
  }

  try {
    final data = await Supabase.instance.client
        .from('board')
        .select('data')
        .eq('user_id', userId)
        .single();

    return data;
  } on PostgrestException catch (e) {
    return {};
  }
});