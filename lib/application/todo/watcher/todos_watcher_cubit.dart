import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_project/domain/failures/failures.dart';
import 'package:my_project/domain/todo/todo.dart';
import 'package:my_project/domain/core/repository.dart';
part 'todos_watcher_state.dart';
part 'todos_watcher_cubit.freezed.dart';


class TodosWatcherCubit extends Cubit<TodosWatcherState> {
  TodosWatcherCubit(this._todosRepository) : super(TodosWatcherState.loading());

  StreamSubscription? _streamSubscription;

  final Repository<Todo> _todosRepository;
  void watchAllTodos() async {
    _streamSubscription?.cancel();
    _streamSubscription = _todosRepository.watchAll().listen((failureOrTodos) {
      emit(failureOrTodos.fold((failure) => TodosWatcherState.loadedFailure(failure), (todos) => TodosWatcherState.loadedSuccess(todos: todos, todoEditTarget: null, isCreatingNewTodo: false)));
    });
  }


  Future<void> updateTodos(List<Todo> newTodos) async{
    await _todosRepository.updateCollection(newTodos);
  }

  void editingStateWith(Todo? todo, bool isNew){
    state.maybeMap(loadedSuccess: (state) => emit(state.copyWith(todoEditTarget: todo, isCreatingNewTodo: isNew)), orElse: (){});
  }

  @override
  Future<void> close() async {
    await _streamSubscription?.cancel();
    super.close();
  }
}
