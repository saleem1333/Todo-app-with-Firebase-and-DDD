import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_project/domain/todo/todo.dart';
import 'package:my_project/infrastructure/core/repository_container.dart';
import 'package:my_project/infrastructure/todo/todo_dto.dart';
import 'package:my_project/infrastructure/core/firebase_firestore_mapper.dart';


class TodosRepository extends RepositoryContainer<Todo> {
  TodosRepository(this._firebaseFirestore);
  final FirebaseFirestore _firebaseFirestore;

  @override
  CollectionReference<Map<String, dynamic>> get targetCollection => _firebaseFirestore.userDocument().collection("todoCollection");


  @override
  Todo fromJson(Map<String, dynamic> json) {
    return TodoDto.fromJson(json).toDomain();
  }

  @override
  Map<String, dynamic> toJson(Todo e) {
    return TodoDto.fromDomain(e).toJson();
  }



}
