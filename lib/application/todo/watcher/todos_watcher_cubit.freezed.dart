// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'todos_watcher_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TodosWatcherStateTearOff {
  const _$TodosWatcherStateTearOff();

  _Loading loading() {
    return const _Loading();
  }

  _LoadedSuccess loadedSuccess(
      {required List<Todo> todos,
      required Todo? todoEditTarget,
      required bool isCreatingNewTodo}) {
    return _LoadedSuccess(
      todos: todos,
      todoEditTarget: todoEditTarget,
      isCreatingNewTodo: isCreatingNewTodo,
    );
  }

  _LoadedFailure loadedFailure(Failure failure) {
    return _LoadedFailure(
      failure,
    );
  }
}

/// @nodoc
const $TodosWatcherState = _$TodosWatcherStateTearOff();

/// @nodoc
mixin _$TodosWatcherState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            List<Todo> todos, Todo? todoEditTarget, bool isCreatingNewTodo)
        loadedSuccess,
    required TResult Function(Failure failure) loadedFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(
            List<Todo> todos, Todo? todoEditTarget, bool isCreatingNewTodo)?
        loadedSuccess,
    TResult Function(Failure failure)? loadedFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadedSuccess value) loadedSuccess,
    required TResult Function(_LoadedFailure value) loadedFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadedSuccess value)? loadedSuccess,
    TResult Function(_LoadedFailure value)? loadedFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodosWatcherStateCopyWith<$Res> {
  factory $TodosWatcherStateCopyWith(
          TodosWatcherState value, $Res Function(TodosWatcherState) then) =
      _$TodosWatcherStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$TodosWatcherStateCopyWithImpl<$Res>
    implements $TodosWatcherStateCopyWith<$Res> {
  _$TodosWatcherStateCopyWithImpl(this._value, this._then);

  final TodosWatcherState _value;
  // ignore: unused_field
  final $Res Function(TodosWatcherState) _then;
}

/// @nodoc
abstract class _$LoadingCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res> extends _$TodosWatcherStateCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(_Loading _value, $Res Function(_Loading) _then)
      : super(_value, (v) => _then(v as _Loading));

  @override
  _Loading get _value => super._value as _Loading;
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading();

  @override
  String toString() {
    return 'TodosWatcherState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            List<Todo> todos, Todo? todoEditTarget, bool isCreatingNewTodo)
        loadedSuccess,
    required TResult Function(Failure failure) loadedFailure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(
            List<Todo> todos, Todo? todoEditTarget, bool isCreatingNewTodo)?
        loadedSuccess,
    TResult Function(Failure failure)? loadedFailure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadedSuccess value) loadedSuccess,
    required TResult Function(_LoadedFailure value) loadedFailure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadedSuccess value)? loadedSuccess,
    TResult Function(_LoadedFailure value)? loadedFailure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements TodosWatcherState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$LoadedSuccessCopyWith<$Res> {
  factory _$LoadedSuccessCopyWith(
          _LoadedSuccess value, $Res Function(_LoadedSuccess) then) =
      __$LoadedSuccessCopyWithImpl<$Res>;
  $Res call({List<Todo> todos, Todo? todoEditTarget, bool isCreatingNewTodo});

  $TodoCopyWith<$Res>? get todoEditTarget;
}

/// @nodoc
class __$LoadedSuccessCopyWithImpl<$Res>
    extends _$TodosWatcherStateCopyWithImpl<$Res>
    implements _$LoadedSuccessCopyWith<$Res> {
  __$LoadedSuccessCopyWithImpl(
      _LoadedSuccess _value, $Res Function(_LoadedSuccess) _then)
      : super(_value, (v) => _then(v as _LoadedSuccess));

  @override
  _LoadedSuccess get _value => super._value as _LoadedSuccess;

  @override
  $Res call({
    Object? todos = freezed,
    Object? todoEditTarget = freezed,
    Object? isCreatingNewTodo = freezed,
  }) {
    return _then(_LoadedSuccess(
      todos: todos == freezed
          ? _value.todos
          : todos // ignore: cast_nullable_to_non_nullable
              as List<Todo>,
      todoEditTarget: todoEditTarget == freezed
          ? _value.todoEditTarget
          : todoEditTarget // ignore: cast_nullable_to_non_nullable
              as Todo?,
      isCreatingNewTodo: isCreatingNewTodo == freezed
          ? _value.isCreatingNewTodo
          : isCreatingNewTodo // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $TodoCopyWith<$Res>? get todoEditTarget {
    if (_value.todoEditTarget == null) {
      return null;
    }

    return $TodoCopyWith<$Res>(_value.todoEditTarget!, (value) {
      return _then(_value.copyWith(todoEditTarget: value));
    });
  }
}

/// @nodoc

class _$_LoadedSuccess implements _LoadedSuccess {
  const _$_LoadedSuccess(
      {required this.todos,
      required this.todoEditTarget,
      required this.isCreatingNewTodo});

  @override
  final List<Todo> todos;
  @override
  final Todo? todoEditTarget;
  @override
  final bool isCreatingNewTodo;

  @override
  String toString() {
    return 'TodosWatcherState.loadedSuccess(todos: $todos, todoEditTarget: $todoEditTarget, isCreatingNewTodo: $isCreatingNewTodo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoadedSuccess &&
            (identical(other.todos, todos) ||
                const DeepCollectionEquality().equals(other.todos, todos)) &&
            (identical(other.todoEditTarget, todoEditTarget) ||
                const DeepCollectionEquality()
                    .equals(other.todoEditTarget, todoEditTarget)) &&
            (identical(other.isCreatingNewTodo, isCreatingNewTodo) ||
                const DeepCollectionEquality()
                    .equals(other.isCreatingNewTodo, isCreatingNewTodo)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(todos) ^
      const DeepCollectionEquality().hash(todoEditTarget) ^
      const DeepCollectionEquality().hash(isCreatingNewTodo);

  @JsonKey(ignore: true)
  @override
  _$LoadedSuccessCopyWith<_LoadedSuccess> get copyWith =>
      __$LoadedSuccessCopyWithImpl<_LoadedSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            List<Todo> todos, Todo? todoEditTarget, bool isCreatingNewTodo)
        loadedSuccess,
    required TResult Function(Failure failure) loadedFailure,
  }) {
    return loadedSuccess(todos, todoEditTarget, isCreatingNewTodo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(
            List<Todo> todos, Todo? todoEditTarget, bool isCreatingNewTodo)?
        loadedSuccess,
    TResult Function(Failure failure)? loadedFailure,
    required TResult orElse(),
  }) {
    if (loadedSuccess != null) {
      return loadedSuccess(todos, todoEditTarget, isCreatingNewTodo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadedSuccess value) loadedSuccess,
    required TResult Function(_LoadedFailure value) loadedFailure,
  }) {
    return loadedSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadedSuccess value)? loadedSuccess,
    TResult Function(_LoadedFailure value)? loadedFailure,
    required TResult orElse(),
  }) {
    if (loadedSuccess != null) {
      return loadedSuccess(this);
    }
    return orElse();
  }
}

abstract class _LoadedSuccess implements TodosWatcherState {
  const factory _LoadedSuccess(
      {required List<Todo> todos,
      required Todo? todoEditTarget,
      required bool isCreatingNewTodo}) = _$_LoadedSuccess;

  List<Todo> get todos => throw _privateConstructorUsedError;
  Todo? get todoEditTarget => throw _privateConstructorUsedError;
  bool get isCreatingNewTodo => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$LoadedSuccessCopyWith<_LoadedSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$LoadedFailureCopyWith<$Res> {
  factory _$LoadedFailureCopyWith(
          _LoadedFailure value, $Res Function(_LoadedFailure) then) =
      __$LoadedFailureCopyWithImpl<$Res>;
  $Res call({Failure failure});
}

/// @nodoc
class __$LoadedFailureCopyWithImpl<$Res>
    extends _$TodosWatcherStateCopyWithImpl<$Res>
    implements _$LoadedFailureCopyWith<$Res> {
  __$LoadedFailureCopyWithImpl(
      _LoadedFailure _value, $Res Function(_LoadedFailure) _then)
      : super(_value, (v) => _then(v as _LoadedFailure));

  @override
  _LoadedFailure get _value => super._value as _LoadedFailure;

  @override
  $Res call({
    Object? failure = freezed,
  }) {
    return _then(_LoadedFailure(
      failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }
}

/// @nodoc

class _$_LoadedFailure implements _LoadedFailure {
  const _$_LoadedFailure(this.failure);

  @override
  final Failure failure;

  @override
  String toString() {
    return 'TodosWatcherState.loadedFailure(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoadedFailure &&
            (identical(other.failure, failure) ||
                const DeepCollectionEquality().equals(other.failure, failure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failure);

  @JsonKey(ignore: true)
  @override
  _$LoadedFailureCopyWith<_LoadedFailure> get copyWith =>
      __$LoadedFailureCopyWithImpl<_LoadedFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            List<Todo> todos, Todo? todoEditTarget, bool isCreatingNewTodo)
        loadedSuccess,
    required TResult Function(Failure failure) loadedFailure,
  }) {
    return loadedFailure(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(
            List<Todo> todos, Todo? todoEditTarget, bool isCreatingNewTodo)?
        loadedSuccess,
    TResult Function(Failure failure)? loadedFailure,
    required TResult orElse(),
  }) {
    if (loadedFailure != null) {
      return loadedFailure(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadedSuccess value) loadedSuccess,
    required TResult Function(_LoadedFailure value) loadedFailure,
  }) {
    return loadedFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadedSuccess value)? loadedSuccess,
    TResult Function(_LoadedFailure value)? loadedFailure,
    required TResult orElse(),
  }) {
    if (loadedFailure != null) {
      return loadedFailure(this);
    }
    return orElse();
  }
}

abstract class _LoadedFailure implements TodosWatcherState {
  const factory _LoadedFailure(Failure failure) = _$_LoadedFailure;

  Failure get failure => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$LoadedFailureCopyWith<_LoadedFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
