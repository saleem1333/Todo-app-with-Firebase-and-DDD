// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'todo_form_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TodoFormStateTearOff {
  const _$TodoFormStateTearOff();

  _TodosFormState call({required Todo todo, required bool isEditing}) {
    return _TodosFormState(
      todo: todo,
      isEditing: isEditing,
    );
  }
}

/// @nodoc
const $TodoFormState = _$TodoFormStateTearOff();

/// @nodoc
mixin _$TodoFormState {
  Todo get todo => throw _privateConstructorUsedError;
  bool get isEditing => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TodoFormStateCopyWith<TodoFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoFormStateCopyWith<$Res> {
  factory $TodoFormStateCopyWith(
          TodoFormState value, $Res Function(TodoFormState) then) =
      _$TodoFormStateCopyWithImpl<$Res>;
  $Res call({Todo todo, bool isEditing});

  $TodoCopyWith<$Res> get todo;
}

/// @nodoc
class _$TodoFormStateCopyWithImpl<$Res>
    implements $TodoFormStateCopyWith<$Res> {
  _$TodoFormStateCopyWithImpl(this._value, this._then);

  final TodoFormState _value;
  // ignore: unused_field
  final $Res Function(TodoFormState) _then;

  @override
  $Res call({
    Object? todo = freezed,
    Object? isEditing = freezed,
  }) {
    return _then(_value.copyWith(
      todo: todo == freezed
          ? _value.todo
          : todo // ignore: cast_nullable_to_non_nullable
              as Todo,
      isEditing: isEditing == freezed
          ? _value.isEditing
          : isEditing // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $TodoCopyWith<$Res> get todo {
    return $TodoCopyWith<$Res>(_value.todo, (value) {
      return _then(_value.copyWith(todo: value));
    });
  }
}

/// @nodoc
abstract class _$TodosFormStateCopyWith<$Res>
    implements $TodoFormStateCopyWith<$Res> {
  factory _$TodosFormStateCopyWith(
          _TodosFormState value, $Res Function(_TodosFormState) then) =
      __$TodosFormStateCopyWithImpl<$Res>;
  @override
  $Res call({Todo todo, bool isEditing});

  @override
  $TodoCopyWith<$Res> get todo;
}

/// @nodoc
class __$TodosFormStateCopyWithImpl<$Res>
    extends _$TodoFormStateCopyWithImpl<$Res>
    implements _$TodosFormStateCopyWith<$Res> {
  __$TodosFormStateCopyWithImpl(
      _TodosFormState _value, $Res Function(_TodosFormState) _then)
      : super(_value, (v) => _then(v as _TodosFormState));

  @override
  _TodosFormState get _value => super._value as _TodosFormState;

  @override
  $Res call({
    Object? todo = freezed,
    Object? isEditing = freezed,
  }) {
    return _then(_TodosFormState(
      todo: todo == freezed
          ? _value.todo
          : todo // ignore: cast_nullable_to_non_nullable
              as Todo,
      isEditing: isEditing == freezed
          ? _value.isEditing
          : isEditing // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_TodosFormState implements _TodosFormState {
  const _$_TodosFormState({required this.todo, required this.isEditing});

  @override
  final Todo todo;
  @override
  final bool isEditing;

  @override
  String toString() {
    return 'TodoFormState(todo: $todo, isEditing: $isEditing)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TodosFormState &&
            (identical(other.todo, todo) ||
                const DeepCollectionEquality().equals(other.todo, todo)) &&
            (identical(other.isEditing, isEditing) ||
                const DeepCollectionEquality()
                    .equals(other.isEditing, isEditing)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(todo) ^
      const DeepCollectionEquality().hash(isEditing);

  @JsonKey(ignore: true)
  @override
  _$TodosFormStateCopyWith<_TodosFormState> get copyWith =>
      __$TodosFormStateCopyWithImpl<_TodosFormState>(this, _$identity);
}

abstract class _TodosFormState implements TodoFormState {
  const factory _TodosFormState({required Todo todo, required bool isEditing}) =
      _$_TodosFormState;

  @override
  Todo get todo => throw _privateConstructorUsedError;
  @override
  bool get isEditing => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TodosFormStateCopyWith<_TodosFormState> get copyWith =>
      throw _privateConstructorUsedError;
}
