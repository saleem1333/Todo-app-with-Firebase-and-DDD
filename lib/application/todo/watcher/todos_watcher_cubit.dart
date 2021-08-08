import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_project/domain/failures/failures.dart';
import 'package:my_project/domain/todo/todo.dart';
import 'package:my_project/domain/todo/todos_repository_facade.dart';
part 'todos_watcher_state.dart';
part 'todos_watcher_cubit.freezed.dart';


class TodosWatcherCubit extends Cubit<TodosWatcherState> {
  TodosWatcherCubit(this._todosRepositoryFacade) : super(TodosWatcherState.loading());

  StreamSubscription? _streamSubscription;

  final TodosRepositoryFacade _todosRepositoryFacade;
  void watchAllTodos() async {
    _streamSubscription?.cancel();
    _streamSubscription = _todosRepositoryFacade.watchAllTodos().listen((failureOrTodos) {
      emit(failureOrTodos.fold((failure) => TodosWatcherState.loadedFailure(failure), (todos) => TodosWatcherState.loadedSuccess(todos: todos, todoEditTarget: null)));
    });
  }

  void editingStateWith(Todo? todo){
    state.maybeMap(loadedSuccess: (state) => emit(state.copyWith(todoEditTarget: todo)), orElse: (){});
  }

  @override
  Future<void> close() async {
    await _streamSubscription?.cancel();
    super.close();
  }
}
