import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_project/domain/todo/todo.dart';
import 'package:my_project/domain/failures/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:my_project/domain/todo/todos_repository_facade.dart';
import 'package:my_project/infrastructure/todo/todo_dto.dart';
import '../core/firebase_firestore_mapper.dart';


class TodosRepository implements TodosRepositoryFacade {
  TodosRepository(this._firebaseFirestore);
  final FirebaseFirestore _firebaseFirestore;


  @override
  Stream<Either<Failure, List<Todo>>> watchAllTodos() async* {
    final _snapshots = _firebaseFirestore.userDocument().collection("todos").snapshots();
    yield* _snapshots
        .map((querySnapshot) => right<Failure, List<Todo>>(querySnapshot.docs.map((json) => TodoDto.fromJson(json.data()).toDomain()).toList()))
        .handleError((_) => left(Failure("Something happened while fetching the todos.")));
  }

  
  @override
  Future<Either<Failure, Unit>> create(Todo todo) async {
    TodoDto todoDto = TodoDto.fromDomain(todo);
    Map<String, dynamic> json = todoDto.toJson();
    try {
  
      await _firebaseFirestore.userDocument().collection("todos").doc(todo.id).set(json);
      return right(unit);
    } catch (_) {
      return left(Failure("Something unexpected happened while creating!"));
    }
  }

  @override
  Future<Either<Failure, Unit>> update(Todo todo) async {
    final todoDto = TodoDto.fromDomain(todo);
    final json = todoDto.toJson();
    try {
      await _firebaseFirestore.userDocument().collection("todos").doc(todo.id).set(json);
      return right(unit);
    } catch (_) {
      return left(Failure("Something unexpected happened while updating!"));
    }
  }

  @override
  Future<Either<Failure, Unit>> delete(Todo todo) async {
    TodoDto todoDto = TodoDto.fromDomain(todo);
    try {
      await _firebaseFirestore.userDocument().collection("todos").doc(todoDto.id).delete();
      return right(unit);
    } catch (_) {
      return left(Failure("Something unexpected happened while deleting!"));
    }
  }
}
