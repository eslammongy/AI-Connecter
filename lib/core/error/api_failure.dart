import 'package:ai_connect/core/error/api_error_msg.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class Failure {
  final SupabaseErrorCode? errorCode;
  final String? message;

  const Failure({
    this.errorCode,
    this.message,
  });
}

class ConnectionFailure extends Failure {
  ConnectionFailure({required String message}) : super(message: message);
}

/// Error handler class for Supabase exceptions
class SupabaseExpHandler extends Failure {
  SupabaseExpHandler({
    super.errorCode,
    super.message,
  });

  /// Handles exceptions from auth operations
  factory SupabaseExpHandler.authError({required AuthException exp}) {
    if (exp.statusCode == null) {
      return _supabaseExceptionHandler(
          code: SupabaseErrorCode.unknownError, errors: authErrorMessages);
    }
    // case the AuthException has a status code but the code doesn't exist on SupabaseErrorCode
    if (!SupabaseErrorCode.values
        .map((e) => e.name)
        .contains(exp.statusCode!)) {
      return _supabaseExceptionHandler(
          code: SupabaseErrorCode.unknownError, errors: authErrorMessages);
    }
    final statusCode = SupabaseErrorCode.values.byName(exp.statusCode!);
    return _supabaseExceptionHandler(
        code: statusCode, errors: authErrorMessages); //
  }

  /// Handles exceptions from storage operations
  factory SupabaseExpHandler.storageError(StorageException exp) {
    final statusCode = SupabaseErrorCode.values.byName(exp.statusCode!);
    return _supabaseExceptionHandler(
        code: statusCode, errors: storageErrorMessages);
  }

  /// Handles exceptions from database operations
  factory SupabaseExpHandler.databaseException(PostgrestException exp) {
    switch (exp.code) {
      case 'PGRST116':
        return _supabaseExceptionHandler(
          code: SupabaseErrorCode.tableNotFound,
        );
      case 'PGRST117':
        return _supabaseExceptionHandler(
          code: SupabaseErrorCode.columnNotFound,
        );
      case '23505':
        return _supabaseExceptionHandler(
          code: SupabaseErrorCode.duplicateRow,
        );
      case '23503':
        return _supabaseExceptionHandler(
          code: SupabaseErrorCode.constraintViolation,
        );

      case '22000':
        return _supabaseExceptionHandler(
          code: SupabaseErrorCode.invalidInputSyntax,
        );

      case '57014':
        return _supabaseExceptionHandler(
          code: SupabaseErrorCode.databaseTimeout,
        );

      case '40001':
        return _supabaseExceptionHandler(
          code: SupabaseErrorCode.transactionFailed,
        );

      case '42501':
        return _supabaseExceptionHandler(
          code: SupabaseErrorCode.insufficientPermissions,
        );
      default:
        return _supabaseExceptionHandler(
          code: SupabaseErrorCode.unexpectedDatabaseError,
        );
    }
  }

  /// Creates a SupabaseExceptionHandler instance based on the provided error code and flag. The error message is determined by the flag value:
  /// - If flag is 0, the error message is retrieved from [storageErrorMessages]. - Otherwise, the error message is retrieved from [authErrorMessages].
  static SupabaseExpHandler _supabaseExceptionHandler({
    required SupabaseErrorCode code,
    Map errors = dbErrorMessages,
  }) {
    return SupabaseExpHandler(
      errorCode: code,
      message: errors[code],
    );
  }
}

class LocalFailure extends Failure {
  LocalFailure({super.message});

  factory LocalFailure.handleError(Failure failure) {
    return LocalFailure(message: failure.message);
  }
}
