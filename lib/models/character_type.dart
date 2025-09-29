import 'dart:ui';

enum CharacterType {
  cool('냉정', Color(0xFF83B9EA)),
  gloomy('우울', Color(0xFFC683EC)),
  brisk('활발', Color(0xFFEBDB82)),
  crazy('광기', Color(0xFFEB839A)),
  pure('순수', Color(0xFF66C17C));
  // resonance('공명', Color(0xFF000000))

  final String title;
  final Color color;

  const CharacterType(
    this.title,
    this.color,
  );
}