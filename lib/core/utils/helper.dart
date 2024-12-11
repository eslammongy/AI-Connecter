import 'package:ai_connect/core/constant/constants.dart';
import 'package:ai_connect/core/datasource/app_storage.dart';
import 'package:ai_connect/core/theme/app_theme.dart';
import 'package:ai_connect/core/theme/text_style.dart';
import 'package:ai_connect/features/auth/domain/usecases/auth_with_apple_ucase.dart';
import 'package:ai_connect/features/auth/domain/usecases/auth_with_google_ucase.dart';
import 'package:ai_connect/features/auth/domain/usecases/auth_with_phone_ucase.dart';
import 'package:ai_connect/features/auth/domain/usecases/keep_user_logged_uc.dart';
import 'package:ai_connect/features/auth/domain/usecases/sign_out_ucase.dart';
import 'package:ai_connect/features/auth/domain/usecases/verify_phone_otp_ucase.dart';
import 'package:ai_connect/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ai_connect/features/settings/domain/usecases/change_chatting_font_uc.dart';
import 'package:ai_connect/features/settings/domain/usecases/set_app_theme_uc.dart';
import 'package:ai_connect/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:ai_connect/service_locator.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

var pubBoxDecoration = BoxDecoration(
  borderRadius: const BorderRadius.all(Radius.circular(100)),
  boxShadow: [staticBoxShadow],
  gradient: const LinearGradient(
    colors: [
      Color(0xFF5F20F1),
      Color(0xFF831D95),
      Color(0xFFAE0606),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.0, 0.5, 1.0], // Optional, controls the distribution of colors
  ),
);

BoxDecoration customizedDecorationBox(List<Color> colors,
    {double radius = 12}) {
  return BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(radius)),
    gradient: LinearGradient(
      colors: colors,
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: const [0.0, 1.0], // Optional, controls the distribution of colors
    ),
  );
}

/// Throws a DioException with a connection error type. This is used to
/// simulate a network connection error when fetching remote data.
DioException noConnection() => DioException(
      requestOptions: RequestOptions(),
      type: DioExceptionType.connectionError,
    );

/// Throws a DioException with a Bad Response type. This is used to
/// simulate a bad response error when fetching remote data.
DioException badResponse(Response response) {
  final dioError = DioException(
    requestOptions: response.requestOptions,
    error: response.statusMessage,
    type: DioExceptionType.badResponse,
    response: response,
  );
  return dioError;
}

/// This method is used to display a loading widget
Center displayLoadingWidget(
  BuildContext context, {
  String loadingMsg = "please waiting...",
}) {
  return Center(
      child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const CircularProgressIndicator.adaptive(),
      Text(
        loadingMsg,
        textAlign: TextAlign.center,
        style: AppTextStyles.styleBold16(context),
      ),
    ],
  ));
}

get staticBoxShadow => BoxShadow(
      color: Colors.black.withOpacity(0.2), // Shadow color with transparency
      spreadRadius: 2, // How far the shadow extends
      blurRadius: 2, // Blur effect
      offset: const Offset(1, 1), // Shadow position (x, y)
    );

String dateTimeFormatter(DateTime dateTime) {
  final formatDT = DateFormat.MMMEd().format(dateTime);
  // Parse the string into a DateTime object
  return formatDT;
}

/// displaying a customized snackbar
void displaySnackBar(BuildContext context, String msg,
    {bool isFailState = true}) {
  final theme = Theme.of(context);
  final snackBar = SnackBar(
    content: Center(
      child: Text(
        msg,
        maxLines: 3,
        style: theme.textTheme.bodyLarge,
      ),
    ),
    margin: const EdgeInsets.only(right: 20, left: 20, bottom: 40),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    backgroundColor:
        isFailState ? theme.appColors.error : theme.colorScheme.primary,
    duration: const Duration(milliseconds: 1500),
    behavior: SnackBarBehavior.floating,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

/// The phone number must:
/// - Contain only digits, optional '+' at the start.
/// - Be between 10 and 15 characters in length.
bool isValidPhoneNumber(String phoneNumber) {
  // Regex for validating phone numbers
  final regex = RegExp(r'^\+?[0-9]{10,15}$');
  // Check if the phone number matches the regex
  return regex.hasMatch(phoneNumber);
}

SettingsBloc get getSettingsBloc => SettingsBloc(
      switchAppThemeUCase: getIt<SetAppThemeUCase>(),
      changeChattingFontUCase: getIt<ChangeChattingFontUCase>(),
    );

AuthBloc get getAuthBloc => AuthBloc(
      keepUserSignedInUCase: getIt<KeepUserSignedInUCase>(),
      authWithGoogleUCase: getIt<AuthWithGoogleUCase>(),
      authWithAppleUCase: getIt<AuthWithAppleUCase>(),
      authWithPhoneUCase: getIt<AuthWithPhoneUCase>(),
      verifyPhoneOtpUCase: getIt<VerifyPhoneOtpUCase>(),
      signOutUCase: getIt<SignOutUCase>(),
    );

@override
Future<bool> checkIsUserSigned() async {
  final appStorage = getIt<AppStorage>();
  try {
    final token = await appStorage.getFromAppStorage(
      AppConstants.keepUserLoggedKey,
    );
    debugPrint("Auth Token: $token");
    return token == null ? false : true;
  } catch (e) {
    return false;
  }
}
