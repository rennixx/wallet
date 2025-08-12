import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure([this.props = const <dynamic>[]]);

  @override
  final List<Object?> props;
}

// General Failures
class ServerFailure extends Failure {
  final String message;
  ServerFailure({required this.message}) : super([message]);
}

class CacheFailure extends Failure {
  final String message;
  CacheFailure({required this.message}) : super([message]);
}

class NetworkFailure extends Failure {
  final String message;
  NetworkFailure({required this.message}) : super([message]);
}

// Auth Failures
class AuthFailure extends Failure {
  final String message;
  AuthFailure({required this.message}) : super([message]);
}

class InvalidCredentialsFailure extends AuthFailure {
  InvalidCredentialsFailure({super.message = 'Invalid credentials'});
}

class UserNotFoundFailure extends AuthFailure {
  UserNotFoundFailure({super.message = 'User not found'});
}

class EmailAlreadyInUseFailure extends AuthFailure {
  EmailAlreadyInUseFailure({super.message = 'Email already in use'});
}

class WeakPasswordFailure extends AuthFailure {
  WeakPasswordFailure({super.message = 'Weak password'});
}

// Database Failures
class DatabaseFailure extends Failure {
  final String message;
  DatabaseFailure({required this.message}) : super([message]);
}

class NotFoundFailure extends DatabaseFailure {
  NotFoundFailure({super.message = 'Not found'});
}

class AlreadyExistsFailure extends DatabaseFailure {
  AlreadyExistsFailure({super.message = 'Already exists'});
}

// Validation Failures
class ValidationFailure extends Failure {
  final String message;
  ValidationFailure({required this.message}) : super([message]);
}

// Unknown Failure
class UnknownFailure extends Failure {
  final String message;
  UnknownFailure({required this.message}) : super([message]);
}
