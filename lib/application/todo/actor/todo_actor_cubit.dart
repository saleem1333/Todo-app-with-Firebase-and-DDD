import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_project/domain/failures/failures.dart';
import 'package:my_project/domain/todo/todo.dart';
import 'package:my_project/domain/todo/todos_repository_facade.dart';

part 'todo_actor_state.dart';
part 'todo_actor_cubit.freezed.dart';

class TodoActorCubit extends Cubit<TodoActorState> {
  TodoActorCubit(this._todosRepositoryFacade) : super(TodoActorState.initial());


  final TodosRepositoryFacade _todosRepositoryFacade;

  Future<void> create(Todo todo) async {
    emit(state.copyWith(isActionLoading: true, actionFailureOrSuccess: null));
    Either<Failure, Unit> failureOrSuccess = await _todosRepositoryFacade.create(todo);
    emit(state.copyWith(isActionLoading: false, actionFailureOrSuccess: failureOrSuccess));
  }

  void update(Todo todo) async {
    emit(state.copyWith(isActionLoading: true, actionFailureOrSuccess: null));
    Either<Failure, Unit> failureOrSuccess = await _todosRepositoryFacade.update(todo);
    emit(state.copyWith(isActionLoading: false, actionFailureOrSuccess: failureOrSuccess));
  }

  void delete(Todo todo) async {
    emit(state.copyWith(isActionLoading: true, actionFailureOrSuccess: null));
    Either<Failure, Unit> failureOrSuccess = await _todosRepositoryFacade.delete(todo);
    emit(state.copyWith(isActionLoading: false, actionFailureOrSuccess: failureOrSuccess));
  }

  void soger(){
  }
}
