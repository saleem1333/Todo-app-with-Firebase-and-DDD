import 'package:dartz/dartz.dart';
import 'package:my_project/domain/core/error.dart';
import 'package:my_project/domain/failures/failures.dart';
import 'package:meta/meta.dart';

abstract class ValueObject<Value> {
  final Value value;

  late final Either<Failure, Value> validation;

  ValueObject(this.value) {
    validation = validate();
  }

  bool isValid() => validation.isRight();

  Value getOrCrash() => validation.getOrElse(() => throw UnexpectedError());

  @protected
  Either<Failure, Value> validate();
}


abstract class Confirmation<T extends ValueObject> extends ValueObject{
  Confirmation(value, this.confirmationTarget) : super(value);

  final T confirmationTarget;


  Failure onNotMatch();
  @override
  Either<Failure, dynamic> validate() {
    assert(value.runtimeType == confirmationTarget.value.runtimeType, "Unidentical runtime matching");
    if(value != confirmationTarget.value) return left(onNotMatch());
    return right(confirmationTarget.value);
  }
}


abstract class ValueObjectGroup {
  const ValueObjectGroup();
  bool isValid() => valueObjects.every((element) => element.isValid());
  List<ValueObject> get valueObjects;
}

class EmailAddress extends ValueObject<String> {
  EmailAddress(String value) : super(value);

  @override
  Either<Failure, String> validate() {
    const emailRegex = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    if (RegExp(emailRegex).hasMatch(value)) {
      return right(value.trim());
    } else {
      return left(Failure("Email is invalid."));
    }
  }
}

class Password extends ValueObject<String> {
  Password(String value) : super(value);

  static const MIN_PASSWORD_LENGTH = 5;
  static const MAX_PASSWORD_LENGTH = 15;

  @override
  Either<Failure, String> validate() {
    if (value.length < MIN_PASSWORD_LENGTH)
      return left(Failure("Password is too short."));
    else if (value.length > MAX_PASSWORD_LENGTH) return left(Failure("Password is too long."));
    return right(value);
  }
}

class PasswordConfirmation extends Confirmation<Password> {
  PasswordConfirmation(String value, {required this.password}) : super(value, password);

  final Password password;

  @override
  Failure onNotMatch() {
    return Failure("Password doesn't match!");
  }
}
