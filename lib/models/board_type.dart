enum BoardType {
  attack(title: '공격력', increment: 6), // 공격력
  physicalDefense(title: '물리 방어력', increment: 8), // 물리방어력
  magicalDefense(title: '마법 방어력', increment: 8), // 마법방어력
  fatalBlow(title: '치명타', increment: 8), /// 치명타
  fatalDamage(title: '치명 피해', increment: 8), // 치명피해
  fatalBlowDefense(title: '치명타 저항', increment: 8), // 치명타저항
  fatalDamageDefense(title: '치명 피해 저항', increment: 8), // 치명피해저항
  hp(title: 'HP', increment: 8); // 체력

  final String title;
  final int increment;

  const BoardType({
    required this.increment,
    required this.title,
  });
}