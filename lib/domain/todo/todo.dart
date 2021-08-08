import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_project/domain/core/id_generator.dart';
import 'package:my_project/domain/core/value_objects.dart';
import 'package:my_project/domain/todo/value_objects.dart';
part 'todo.freezed.dart';

@freezed
class Todo extends ValueObjectGroup with _$Todo {
  const Todo._();
  const factory Todo({required String id, required TodoName name, required bool done}) = _Todo;

  factory Todo.empty() => Todo(id: generateId(), name: TodoName(''), done: false);


  @override
  List<ValueObject> get valueObjects => [name];
}


