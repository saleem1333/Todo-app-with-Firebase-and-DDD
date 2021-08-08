import 'package:dartz/dartz.dart';
import 'package:my_project/domain/failures/failures.dart';
import 'package:my_project/domain/todo/todo.dart';

abstract class TodosRepositoryFacade{
  Stream<Either<Failure, List<Todo>>> watchAllTodos(); 
  Future<Either<Failure, Unit>> create(Todo todo);
  Future<Either<Failure,Unit>> update(Todo todo);
  Future<Either<Failure,Unit>> delete(Todo todo);
}


