import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';

@JsonEnum(valueField: 'code')
enum CharacterType {
  cool('냉정', Color(0xFF83B9EA), Color(0xFFA4CFF6),'cool'),
  gloomy('우울', Color(0xFFC683EC), Color(0xFFD6A1F5), 'gloomy'),
  brisk('활발', Color(0xFFEBDB82), Color(0xFFF8ECA8),'brisk'),
  crazy('광기', Color(0xFFEB839A), Color(0xFFF6AABC),'crazy'),
  pure('순수', Color(0xFF66C17C), Color(0xFF92F3AA), 'pure');
  // resonance('공명', Color(0xFF000000))

  final String title;
  final Color color;
  final Color secondaryColor;
  final String code;

  const CharacterType(
    this.title,
    this.color,
    this.secondaryColor,
    this.code,
  );
}