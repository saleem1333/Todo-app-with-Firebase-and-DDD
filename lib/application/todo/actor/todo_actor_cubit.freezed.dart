// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'todo_actor_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TodoActorStateTearOff {
  const _$TodoActorStateTearOff();

  _TodoActorState call(
      {required bool isActionLoading,
      required Either<Failure, Unit>? actionFailureOrSuccess}) {
    return _TodoActorState(
      isActionLoading: isActionLoading,
      actionFailureOrSuccess: actionFailureOrSuccess,
    );
  }
}

/// @nodoc
const $TodoActorState = _$TodoActorStateTearOff();

/// @nodoc
mixin _$TodoActorState {
  bool get isActionLoading => throw _privateConstructorUsedError;
  Either<Failure, Unit>? get actionFailureOrSuccess =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TodoActorStateCopyWith<TodoActorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoActorStateCopyWith<$Res> {
  factory $TodoActorStateCopyWith(
          TodoActorState value, $Res Function(TodoActorState) then) =
      _$TodoActorStateCopyWithImpl<$Res>;
  $Res call(
      {bool isActionLoading, Either<Failure, Unit>? actionFailureOrSuccess});
}

/// @nodoc
class _$TodoActorStateCopyWithImpl<$Res>
    implements $TodoActorStateCopyWith<$Res> {
  _$TodoActorStateCopyWithImpl(this._value, this._then);

  final TodoActorState _value;
  // ignore: unused_field
  final $Res Function(TodoActorState) _then;

  @override
  $Res call({
    Object? isActionLoading = freezed,
    Object? actionFailureOrSuccess = freezed,
  }) {
    return _then(_value.copyWith(
      isActionLoading: isActionLoading == freezed
          ? _value.isActionLoading
          : isActionLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      actionFailureOrSuccess: actionFailureOrSuccess == freezed
          ? _value.actionFailureOrSuccess
          : actionFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Either<Failure, Unit>?,
    ));
  }
}

/// @nodoc
abstract class _$TodoActorStateCopyWith<$Res>
    implements $TodoActorStateCopyWith<$Res> {
  factory _$TodoActorStateCopyWith(
          _TodoActorState value, $Res Function(_TodoActorState) then) =
      __$TodoActorStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isActionLoading, Either<Failure, Unit>? actionFailureOrSuccess});
}

/// @nodoc
class __$TodoActorStateCopyWithImpl<$Res>
    extends _$TodoActorStateCopyWithImpl<$Res>
    implements _$TodoActorStateCopyWith<$Res> {
  __$TodoActorStateCopyWithImpl(
      _TodoActorState _value, $Res Function(_TodoActorState) _then)
      : super(_value, (v) => _then(v as _TodoActorState));

  @override
  _TodoActorState get _value => super._value as _TodoActorState;

  @override
  $Res call({
    Object? isActionLoading = freezed,
    Object? actionFailureOrSuccess = freezed,
  }) {
    return _then(_TodoActorState(
      isActionLoading: isActionLoading == freezed
          ? _value.isActionLoading
          : isActionLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      actionFailureOrSuccess: actionFailureOrSuccess == freezed
          ? _value.actionFailureOrSuccess
          : actionFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Either<Failure, Unit>?,
    ));
  }
}

/// @nodoc

class _$_TodoActorState implements _TodoActorState {
  const _$_TodoActorState(
      {required this.isActionLoading, required this.actionFailureOrSuccess});

  @override
  final bool isActionLoading;
  @override
  final Either<Failure, Unit>? actionFailureOrSuccess;

  @override
  String toString() {
    return 'TodoActorState(isActionLoading: $isActionLoading, actionFailureOrSuccess: $actionFailureOrSuccess)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TodoActorState &&
            (identical(other.isActionLoading, isActionLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isActionLoading, isActionLoading)) &&
            (identical(other.actionFailureOrSuccess, actionFailureOrSuccess) ||
                const DeepCollectionEquality().equals(
                    other.actionFailureOrSuccess, actionFailureOrSuccess)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isActionLoading) ^
      const DeepCollectionEquality().hash(actionFailureOrSuccess);

  @JsonKey(ignore: true)
  @override
  _$TodoActorStateCopyWith<_TodoActorState> get copyWith =>
      __$TodoActorStateCopyWithImpl<_TodoActorState>(this, _$identity);
}

abstract class _TodoActorState implements TodoActorState {
  const factory _TodoActorState(
          {required bool isActionLoading,
          required Either<Failure, Unit>? actionFailureOrSuccess}) =
      _$_TodoActorState;

  @override
  bool get isActionLoading => throw _privateConstructorUsedError;
  @override
  Either<Failure, Unit>? get actionFailureOrSuccess =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TodoActorStateCopyWith<_TodoActorState> get copyWith =>
      throw _privateConstructorUsedError;
}
