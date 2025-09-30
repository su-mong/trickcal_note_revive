import 'package:freezed_annotation/freezed_annotation.dart';

@JsonEnum(valueField: 'code')
enum BoardState {
  /// 캐릭터 미보유
  notHave('n'),
  /// 캐릭터 보유, but 보드 잠김
  lock('l'),
  /// 캐릭터 보유, 보드 열림, 아직 안 칠함
  inactive('i'),
  /// 보드 칠함
  active('a');

  final String code;
  const BoardState(this.code);
}