
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_project/domain/failures/failures.dart';
import 'package:my_project/domain/core/value_objects.dart';

abstract class IAuthFacade{
  Future<Either<Failure, Unit>> signInWithEmailAndPassword({required EmailAddress email, required Password password});
  Future<Either<Failure, Unit>> createUserWithEmailAndPassword({required EmailAddress email, required Password password});
  User? get currentUser;
  Future<void> signOut();
}