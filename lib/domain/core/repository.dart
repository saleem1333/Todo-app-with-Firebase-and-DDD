import 'package:dartz/dartz.dart';
import 'package:my_project/domain/failures/failures.dart';

abstract class Repository<T> {
  Stream<Either<Failure, List<T>>> watchAll();
  Future<Either<Failure, Unit>> create(T element);
  Future<Either<Failure, Unit>> update(T element);
  Future<Either<Failure, Unit>> delete(T element);
  Future<Either<Failure, Unit>> updateCollection(List<T> collection);
}