import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_project/domain/todo/todo.dart';
import 'package:my_project/domain/todo/value_objects.dart';

part 'todo_dto.freezed.dart';
part 'todo_dto.g.dart';

@freezed
class TodoDto with _$TodoDto {
  const TodoDto._();
  const factory TodoDto({required String id, required String name, required bool done}) = _TodoDto;

  factory TodoDto.fromJson(Map<String, dynamic> json) => _$TodoDtoFromJson(json);
  factory TodoDto.fromDomain(Todo todo) => TodoDto(id: todo.id, name: todo.name.getOrCrash(), done: todo.done);

  Todo toDomain() => Todo(id: id, name: TodoName(name), done: done);
}
