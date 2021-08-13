import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:my_project/domain/core/id_generator.dart';
import 'package:my_project/domain/failures/failures.dart';
import 'package:my_project/domain/core/repository.dart';

abstract class RepositoryContainer<T> implements Repository<T> {
  Future<DocumentReference<Map<String, dynamic>>>? _container;

  Future<DocumentReference<Map<String, dynamic>>> _getFuturedContainer() async {
    var collection = await targetCollection.get();
    if (collection.docs.isEmpty) {
      await targetCollection.add({"id": generateId(), "elements": []});
      collection = await targetCollection.get();
    }
    return targetCollection.doc(collection.docs.first.id);
  }

  Future<DocumentReference<Map<String, dynamic>>> get container async {
    _container ??= _getFuturedContainer();
    return _container!;
  }

  Future<Map<String, dynamic>> get currentJsonContent async {
    Future<DocumentSnapshot<Map<String, dynamic>>> docSnapshot = (await container).get();
    return (await docSnapshot).data()!;
  }

  CollectionReference<Map<String, dynamic>> get targetCollection;

  Stream<Either<Failure, List<T>>> watchAll() async* {
    final snapshots = (await container).snapshots();
    yield* snapshots.map((snapshot) => right<Failure, List<T>>(snapshot.data()!["elements"].map<T>((e) => fromJson(e)).toList()));
  }

  Future<Either<Failure, Unit>> create(T e) async {
    // TODO : create should do nothing if e already exists in the database
    final Map<String, dynamic> content = await currentJsonContent;
    content["elements"] = [...content["elements"], toJson(e)];
    await (await container).set(content);
    return right(unit);
  }

  Future<Either<Failure, Unit>> update(T e) async {
    final content = await currentJsonContent;
    final newJson = toJson(e);
    final newElements = content["elements"].map((target) => newJson["id"] == target["id"] ? newJson : target).toList();
    content["elements"] = newElements;
    await (await container).set(content);
    return right(unit);
  }

  Future<Either<Failure, Unit>> delete(T e) async {
    final content = await currentJsonContent;
    content["elements"] = content["elements"].where((target) => toJson(e)["id"] == target["id"]);
    await (await container).set(content);
    return right(unit);
  }

  Future<Either<Failure, Unit>> updateCollection(List<T> collection) async {
    final fetchedContainer = await container;
    await fetchedContainer.update({"elements": collection.map((e) => toJson(e)).toList()});
    return right(unit);
  }

  T fromJson(Map<String, dynamic> json);
  Map<String, dynamic> toJson(T e);
}
