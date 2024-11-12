import 'package:ai_connect/core/theme/text_style.dart';
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

String datetimeFormater(DateTime datetime) {
  final formatDT = DateFormat.MMMEd().format(datetime);
  // Parse the string into a DateTime object
  return formatDT;
}
