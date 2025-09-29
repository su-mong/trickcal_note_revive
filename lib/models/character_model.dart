import 'package:trickcal_note_revive/models/character_type.dart';

class CharacterModel {
  final String name;
  final String engName;
  final CharacterType type;

  const CharacterModel({
    required this.name,
    required this.engName,
    required this.type,
  });
}