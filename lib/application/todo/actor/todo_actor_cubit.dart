import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_project/domain/failures/failures.dart';
import 'package:my_project/domain/todo/todo.dart';
import 'package:my_project/domain/core/repository.dart';

part 'todo_actor_state.dart';
part 'todo_actor_cubit.freezed.dart';

class TodoActorCubit extends Cubit<TodoActorState> {
  TodoActorCubit(this._todosRepository) : super(TodoActorState.initial());


  final Repository<Todo> _todosRepository;

  Future<void> create(Todo todo) async {
    emit(state.copyWith(isActionLoading: true, actionFailureOrSuccess: null));
    Either<Failure, Unit> failureOrSuccess = await _todosRepository.create(todo);
    emit(state.copyWith(isActionLoading: false, actionFailureOrSuccess: failureOrSuccess));
  }

  Future<void> update(Todo todo) async {
    emit(state.copyWith(isActionLoading: true, actionFailureOrSuccess: null));
    Either<Failure, Unit> failureOrSuccess = await _todosRepository.update(todo);
    emit(state.copyWith(isActionLoading: false, actionFailureOrSuccess: failureOrSuccess));
  }

  Future<void> delete(Todo todo) async {
    emit(state.copyWith(isActionLoading: true, actionFailureOrSuccess: null));
    Either<Failure, Unit> failureOrSuccess = await _todosRepository.delete(todo);
    emit(state.copyWith(isActionLoading: false, actionFailureOrSuccess: failureOrSuccess));
  }

  


}
