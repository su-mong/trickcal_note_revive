part of '../character_constants.dart';

/// 공명
abstract class ResonanceCharacterConstants {
  /// ID : 6000번부터 시작
  static const int _baseId = 6000;

  static const CharacterModel uros = CharacterModel(
    id: _baseId + 0,
    name: '우로스',
    engName: 'Uros',
    type: CharacterType.resonance,
  );
}