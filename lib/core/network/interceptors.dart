import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class LoggerInterceptor extends Interceptor {
  Logger logger = Logger(
    printer: PrettyPrinter(methodCount: 0, colors: true, printEmojis: true),
  );

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final options = err.requestOptions;
    final requestPath = '${options.baseUrl}${options.path}';
    logger.e('${options.method} request ==> $requestPath');
    logger.d(
      'Error type: ${err.error} \n '
      'Error message: ${err.message}',
    );
    handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final requestPath = '${options.baseUrl}${options.path}';
    logger.i('${options.method} request ==> $requestPath');
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.d(
      'STATUSCODE: ${response.statusCode} \n '
      'STATUSMESSAGE: ${response.statusMessage} \n'
      'HEADERS: ${response.headers} \n'
      'Data: ${response.data}',
    );
    handler.next(response);
  }
}

class AuthorizationInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // final SharedPreferences sharedPreferences =
    //     await SharedPreferences.getInstance();
    // final token = sharedPreferences.getString('token');
    options.headers['Authorization'] =
        "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2OTA2ZWE5MDIxMWM0ZTQ4ZTgwMTk1NDk3ZDZlOTQ1OSIsIm5iZiI6MTY0ODEwMDIwNC40MzcsInN1YiI6IjYyM2MwMzZjYTM0OTExMDA1ZGM3MDY2NiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Awds54-lk_9tUPu5I9yCTfBWIuOYb0ewWMkpdi6nzt4";
    handler.next(options); 
  }
}
