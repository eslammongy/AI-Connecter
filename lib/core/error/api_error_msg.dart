/// Enum for Supabase error codes, including Auth and Storage-related codes
enum SupabaseErrorCode {
  // Auth-related errors
  anonymousProviderDisabled,
  badCodeVerifier,
  badJson,
  badJwt,
  invalidCredentials,
  emailExists,
  emailNotConfirmed,
  otpExpired,
  weakPassword,
  overRequestRateLimit,
  userNotFound,
  userBanned,

  // Storage-related errors
  fileNotFound,
  bucketNotFound,
  invalidBucketName,
  storageQuotaExceeded,
  storageFileTooLarge,
  invalidFileType,
  permissionDenied,
  rateLimitExceeded,
  serverError,
  unknownError,

  // Database-related errors
  tableNotFound,
  columnNotFound,
  rowNotFound,
  duplicateRow,
  constraintViolation,
  invalidQuery,
  invalidInputSyntax,
  databaseTimeout,
  databaseConflict,
  insufficientPermissions,
  transactionFailed,
  unexpectedDatabaseError,
}

/// Mapping of Supabase error codes to user-friendly messages
const Map<SupabaseErrorCode, String> authErrorMessages = {
  // Auth-related errors
  SupabaseErrorCode.anonymousProviderDisabled:
      'Anonymous sign-ins are currently disabled.',
  SupabaseErrorCode.badCodeVerifier: 'Invalid request. Please try again.',
  SupabaseErrorCode.badJson: 'The request data is not in the correct format.',
  SupabaseErrorCode.badJwt:
      'Invalid authentication token. Please log in again.',
  SupabaseErrorCode.invalidCredentials:
      'Invalid login credentials. Please try again.',
  SupabaseErrorCode.emailExists: 'An account with this email already exists.',
  SupabaseErrorCode.emailNotConfirmed:
      'Please confirm your email before signing in.',
  SupabaseErrorCode.otpExpired:
      'Your OTP has expired. Please request a new one.',
  SupabaseErrorCode.weakPassword:
      'Your password is too weak. Please use a stronger password.',
  SupabaseErrorCode.overRequestRateLimit:
      'Too many requests. Please try again later.',
  SupabaseErrorCode.userNotFound: 'No account found with the provided details.',
  SupabaseErrorCode.userBanned:
      'Your account has been banned. Contact support for help.',
  SupabaseErrorCode.unknownError:
      'An unknown error occurred. Please try again later.',
};

/// Mapping of Supabase error codes to user-friendly messages
const Map<SupabaseErrorCode, String> dbErrorMessages = {
  // Database-related error messages
  SupabaseErrorCode.tableNotFound:
      'The specified database table does not exist.',
  SupabaseErrorCode.columnNotFound:
      'The specified database column does not exist.',
  SupabaseErrorCode.rowNotFound:
      'The requested database row could not be found.',
  SupabaseErrorCode.duplicateRow:
      'A duplicate row already exists in the database.',
  SupabaseErrorCode.constraintViolation: 'A database constraint was violated.',
  SupabaseErrorCode.invalidQuery: 'The database query is invalid.',
  SupabaseErrorCode.invalidInputSyntax:
      'The input syntax for the query is invalid.',
  SupabaseErrorCode.databaseTimeout:
      'The database operation timed out. Please try again later.',
  SupabaseErrorCode.databaseConflict:
      'A conflict occurred in the database operation.',
  SupabaseErrorCode.insufficientPermissions:
      'You do not have the required permissions for this action.',
  SupabaseErrorCode.transactionFailed: 'The database transaction failed.',
  SupabaseErrorCode.unexpectedDatabaseError:
      'An unexpected error occurred during the database operation.',
};

const Map<SupabaseErrorCode, String> storageErrorMessages = {
  // Storage-related errors
  SupabaseErrorCode.fileNotFound: 'The requested file does not exist.',
  SupabaseErrorCode.bucketNotFound:
      'The specified storage bucket does not exist.',
  SupabaseErrorCode.invalidBucketName: 'The provided bucket name is invalid.',
  SupabaseErrorCode.storageQuotaExceeded:
      'You have exceeded your storage quota.',
  SupabaseErrorCode.storageFileTooLarge: 'The uploaded file is too large.',
  SupabaseErrorCode.invalidFileType: 'The uploaded file type is not allowed.',
  SupabaseErrorCode.permissionDenied:
      'You do not have permission to perform this action.',
  SupabaseErrorCode.rateLimitExceeded: 'Too many requests. Please slow down.',
  SupabaseErrorCode.serverError:
      'An internal server error occurred. Please try again later.',
  SupabaseErrorCode.unknownError:
      'An unknown error occurred. Please try again later.',
};

const String connectionFailureMsg = "Please check your internet connection.";
