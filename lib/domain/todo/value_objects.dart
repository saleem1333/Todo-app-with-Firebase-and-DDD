import 'package:dartz/dartz.dart';
import 'package:my_project/domain/core/value_objects.dart';
import 'package:my_project/domain/failures/failures.dart';

class TodoName extends ValueObject<String>{
  TodoName(String value) : super(value);

  @override
  Either<Failure, String> validate() {
    if(value.isEmpty) return left(Failure("Cannot be empty."));
    return right(value);
  }
}