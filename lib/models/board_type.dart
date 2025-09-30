import 'package:freezed_annotation/freezed_annotation.dart';

@JsonEnum(valueField: 'code')
enum BoardType {
  hp(title: 'HP', increment: 8, code: 'hp'), // 체력
  attack(title: '공격력', increment: 6, code: 'atk'), // 공격력
  fatalBlow(title: '치명타', increment: 8, code: 'fb'), /// 치명타
  fatalDamage(title: '치명 피해', increment: 8, code: 'fd'), // 치명피해
  fatalBlowDefense(title: '치명타 저항', increment: 8, code: 'fbd'), // 치명타저항
  fatalDamageDefense(title: '치명 피해 저항', increment: 8, code: 'fdd'), // 치명피해저항
  physicalDefense(title: '물리 방어력', increment: 8, code: 'pdf'), // 물리방어력
  magicalDefense(title: '마법 방어력', increment: 8, code: 'mdf'); // 마법방어력

  final String title;
  final int increment;
  final String code;

  const BoardType({
    required this.increment,
    required this.title,
    required this.code,
  });
}

extension BoardTypeExtension on String {
  BoardType get toBoardType {
    switch(this) {
      case 'atk':
        return BoardType.attack;
      case 'pdf':
        return BoardType.physicalDefense;
      case 'mdf':
        return BoardType.magicalDefense;
      case 'fb':
        return BoardType.fatalBlow;
      case 'fd':
        return BoardType.fatalDamage;
      case 'fbd':
        return BoardType.fatalBlowDefense;
      case 'fdd':
        return BoardType.fatalDamageDefense;
      case 'hp':
        return BoardType.hp;
      default:
        throw Exception('ERROR | toBoardType');
    }
  }
}