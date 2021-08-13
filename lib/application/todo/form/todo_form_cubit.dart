import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_project/application/todo/actor/todo_actor_cubit.dart';
import 'package:my_project/domain/core/error.dart';
import 'package:my_project/domain/failures/failures.dart';
import 'package:my_project/domain/todo/todo.dart';
import 'package:my_project/domain/todo/todos_repository_facade.dart';
import 'package:my_project/domain/todo/value_objects.dart';

part 'todo_form_state.dart';
part 'todo_form_cubit.freezed.dart';

class TodoFormCubit extends Cubit<TodoFormState> {
  TodoFormCubit({required Todo todo, required this.actor}) : super(TodoFormState.initial(todo));

  final TodoActorCubit actor;

  
  void todoNameChanged(String todoNameStr) {
    emit(state.copyWith.todo(name: TodoName(todoNameStr)));
  }

  void toggleDone() {
    emit(state.copyWith.todo(done: !state.todo.done));
  }


  Future<void> create() async{
    await actor.create(state.todo);
  }


  Future<void> update() async{
    print(state.todo);
     await actor.update(state.todo);
  }


}
