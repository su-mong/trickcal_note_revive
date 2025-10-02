import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'pages/board_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_ANONKEY']!,
  );

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '트릭컬노트 리바이브!',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'OneMobilePop',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFC0DC7F),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const BoardPage(),
      },
    );
  }
}
