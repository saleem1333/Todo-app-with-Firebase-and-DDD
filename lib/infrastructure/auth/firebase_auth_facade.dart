import 'package:firebase_auth/firebase_auth.dart';
import 'package:dartz/dartz.dart';
import 'package:my_project/domain/auth/i_auth_facade.dart';
import 'package:my_project/domain/connection_checker/connection_checker.dart';
import 'package:my_project/domain/failures/failures.dart';
import 'package:my_project/domain/core/value_objects.dart';

class FirebaseAuthFacade implements IAuthFacade {
  FirebaseAuthFacade(this._firebaseAuth, this._connectionChecker);

  final FirebaseAuth _firebaseAuth;
  final ConnectionChecker _connectionChecker;
  @override
  User? get currentUser => _firebaseAuth.currentUser;

  @override
  Future<Either<Failure, Unit>> createUserWithEmailAndPassword({required EmailAddress email, required Password password}) async {
    try {
      if (!(await _connectionChecker.isConnected)) return left(Failure("Please connect to the internet"));
      await _firebaseAuth.createUserWithEmailAndPassword(email: email.getOrCrash(), password: password.getOrCrash());
      return right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use")
        return left(Failure("Email already exists."));
      else if (e.code == "weak-password")
        return left(Failure("Password is weak."));
      else
        return left(Failure("Something unexpected happened! Please try again later."));
    }
  }

  @override
  Future<Either<Failure, Unit>> signInWithEmailAndPassword({required EmailAddress email, required Password password}) async {
    try {
      if (!(await _connectionChecker.isConnected)) return left(Failure("Please connect to the internet"));

      await _firebaseAuth.signInWithEmailAndPassword(email: email.getOrCrash(), password: password.getOrCrash());
      return right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-disabled")
        return left(Failure("This account is disabled."));
      else if (e.code == "user-not-found")
        return left(Failure("There is no account with the given email."));
      else if (e.code == "wrong-password")
        return left(Failure("Incorrect password."));
      else
        return left(Failure("Something unexpected happened! Please try again later."));
    }
  }

  @override
  Future<void> signOut() {
    return _firebaseAuth.signOut();
  }
}
