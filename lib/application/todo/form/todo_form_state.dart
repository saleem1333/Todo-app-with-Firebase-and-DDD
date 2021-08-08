part of 'todo_form_cubit.dart';

@freezed
class TodoFormState with _$TodoFormState {
  const factory TodoFormState({required Todo todo, required bool isEditing}) =_TodosFormState;

  factory TodoFormState.initial(Todo todo) => TodoFormState(todo: todo, isEditing: true);
}
