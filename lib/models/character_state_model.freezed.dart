// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character_state_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CharacterStateModel {

 CharacterBoardModel get characterBoard; BoardState get state;
/// Create a copy of CharacterStateModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CharacterStateModelCopyWith<CharacterStateModel> get copyWith => _$CharacterStateModelCopyWithImpl<CharacterStateModel>(this as CharacterStateModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CharacterStateModel&&(identical(other.characterBoard, characterBoard) || other.characterBoard == characterBoard)&&(identical(other.state, state) || other.state == state));
}


@override
int get hashCode => Object.hash(runtimeType,characterBoard,state);

@override
String toString() {
  return 'CharacterStateModel(characterBoard: $characterBoard, state: $state)';
}


}

/// @nodoc
abstract mixin class $CharacterStateModelCopyWith<$Res>  {
  factory $CharacterStateModelCopyWith(CharacterStateModel value, $Res Function(CharacterStateModel) _then) = _$CharacterStateModelCopyWithImpl;
@useResult
$Res call({
 CharacterBoardModel characterBoard, BoardState state
});


$CharacterBoardModelCopyWith<$Res> get characterBoard;

}
/// @nodoc
class _$CharacterStateModelCopyWithImpl<$Res>
    implements $CharacterStateModelCopyWith<$Res> {
  _$CharacterStateModelCopyWithImpl(this._self, this._then);

  final CharacterStateModel _self;
  final $Res Function(CharacterStateModel) _then;

/// Create a copy of CharacterStateModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? characterBoard = null,Object? state = null,}) {
  return _then(_self.copyWith(
characterBoard: null == characterBoard ? _self.characterBoard : characterBoard // ignore: cast_nullable_to_non_nullable
as CharacterBoardModel,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as BoardState,
  ));
}
/// Create a copy of CharacterStateModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CharacterBoardModelCopyWith<$Res> get characterBoard {
  
  return $CharacterBoardModelCopyWith<$Res>(_self.characterBoard, (value) {
    return _then(_self.copyWith(characterBoard: value));
  });
}
}


/// Adds pattern-matching-related methods to [CharacterStateModel].
extension CharacterStateModelPatterns on CharacterStateModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CharacterStateModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CharacterStateModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CharacterStateModel value)  $default,){
final _that = this;
switch (_that) {
case _CharacterStateModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CharacterStateModel value)?  $default,){
final _that = this;
switch (_that) {
case _CharacterStateModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CharacterBoardModel characterBoard,  BoardState state)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CharacterStateModel() when $default != null:
return $default(_that.characterBoard,_that.state);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CharacterBoardModel characterBoard,  BoardState state)  $default,) {final _that = this;
switch (_that) {
case _CharacterStateModel():
return $default(_that.characterBoard,_that.state);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CharacterBoardModel characterBoard,  BoardState state)?  $default,) {final _that = this;
switch (_that) {
case _CharacterStateModel() when $default != null:
return $default(_that.characterBoard,_that.state);case _:
  return null;

}
}

}

/// @nodoc


class _CharacterStateModel implements CharacterStateModel {
  const _CharacterStateModel(this.characterBoard, this.state);
  

@override final  CharacterBoardModel characterBoard;
@override final  BoardState state;

/// Create a copy of CharacterStateModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CharacterStateModelCopyWith<_CharacterStateModel> get copyWith => __$CharacterStateModelCopyWithImpl<_CharacterStateModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CharacterStateModel&&(identical(other.characterBoard, characterBoard) || other.characterBoard == characterBoard)&&(identical(other.state, state) || other.state == state));
}


@override
int get hashCode => Object.hash(runtimeType,characterBoard,state);

@override
String toString() {
  return 'CharacterStateModel(characterBoard: $characterBoard, state: $state)';
}


}

/// @nodoc
abstract mixin class _$CharacterStateModelCopyWith<$Res> implements $CharacterStateModelCopyWith<$Res> {
  factory _$CharacterStateModelCopyWith(_CharacterStateModel value, $Res Function(_CharacterStateModel) _then) = __$CharacterStateModelCopyWithImpl;
@override @useResult
$Res call({
 CharacterBoardModel characterBoard, BoardState state
});


@override $CharacterBoardModelCopyWith<$Res> get characterBoard;

}
/// @nodoc
class __$CharacterStateModelCopyWithImpl<$Res>
    implements _$CharacterStateModelCopyWith<$Res> {
  __$CharacterStateModelCopyWithImpl(this._self, this._then);

  final _CharacterStateModel _self;
  final $Res Function(_CharacterStateModel) _then;

/// Create a copy of CharacterStateModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? characterBoard = null,Object? state = null,}) {
  return _then(_CharacterStateModel(
null == characterBoard ? _self.characterBoard : characterBoard // ignore: cast_nullable_to_non_nullable
as CharacterBoardModel,null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as BoardState,
  ));
}

/// Create a copy of CharacterStateModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CharacterBoardModelCopyWith<$Res> get characterBoard {
  
  return $CharacterBoardModelCopyWith<$Res>(_self.characterBoard, (value) {
    return _then(_self.copyWith(characterBoard: value));
  });
}
}

// dart format on
