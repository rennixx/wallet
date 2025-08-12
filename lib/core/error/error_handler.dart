import 'package:supabase_flutter/supabase_flutter.dart' as supabase;
import 'package:postgrest/postgrest.dart';
import 'package:wallet/core/error/exceptions.dart' as custom;
import 'package:wallet/core/error/failures.dart';

class ErrorHandler {
  static Failure handleException(dynamic e) {
    if (e is custom.ServerException) {
      return ServerFailure(message: e.message);
    } else if (e is custom.CacheException) {
      return CacheFailure(message: e.message);
    } else if (e is custom.NetworkException) {
      return NetworkFailure(message: e.message);
    } else if (e is custom.DatabaseException) {
      return DatabaseFailure(message: e.message);
    } else if (e is custom.ValidationException) {
      return ValidationFailure(message: e.message);
    } else if (e is supabase.AuthException) {
      // Handle Supabase Auth errors
      if (e.message.contains('Invalid login credentials')) {
        return InvalidCredentialsFailure(message: e.message);
      } else if (e.message.contains('User not found')) {
        return UserNotFoundFailure(message: e.message);
      } else if (e.message.contains('Email already registered')) {
        return EmailAlreadyInUseFailure(message: e.message);
      } else if (e.message.contains('Weak password')) {
        return WeakPasswordFailure(message: e.message);
      } else {
        return AuthFailure(message: e.message);
      }
    } else if (e is PostgrestException) {
      // Handle Supabase specific errors
      if (e.code == '23505') {
        // Unique violation
        return AlreadyExistsFailure(message: e.message);
      } else if (e.code == '22P02') {
        // Invalid text representation
        return ValidationFailure(message: e.message);
      } else {
        return ServerFailure(message: e.message);
      }
    } else if (e is FormatException) {
      return ValidationFailure(message: e.message);
    } else {
      return UnknownFailure(message: e.toString());
    }
  }
}
