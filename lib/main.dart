import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'pages/board_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://hyrzcblouwxnydealspa.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imh5cnpjYmxvdXd4bnlkZWFsc3BhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTkwNjYyMDEsImV4cCI6MjA3NDY0MjIwMX0.6lQgXQpYfNZcVIny6t4SWC51mMY-CccqH_3PEtyPhu0',
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
