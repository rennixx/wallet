import 'package:dartz/dartz.dart';
import 'package:wallet/core/error/failures.dart';

class InputConverter {
  Either<Failure, int> stringToUnsignedInteger(String str) {
    try {
      final integer = int.parse(str);
      if (integer < 0) throw const FormatException();
      return Right(integer);
    } on FormatException {
      return Left(
        ValidationFailure(message: 'Invalid input: not a positive integer'),
      );
    }
  }

  Either<Failure, double> stringToDouble(String str) {
    try {
      final doubleValue = double.parse(str);
      return Right(doubleValue);
    } on FormatException {
      return Left(
        ValidationFailure(message: 'Invalid input: not a valid number'),
      );
    }
  }

  Either<Failure, String> validateEmail(String email) {
    // Basic email regex validation
    final bool emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(email);
    if (emailValid) {
      return Right(email);
    } else {
      return Left(ValidationFailure(message: 'Invalid email format'));
    }
  }

  Either<Failure, String> validatePassword(String password) {
    if (password.length >= 8) {
      return Right(password);
    } else {
      return Left(
        ValidationFailure(
          message: 'Password must be at least 8 characters long',
        ),
      );
    }
  }
}
