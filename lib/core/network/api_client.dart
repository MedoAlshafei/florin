import 'package:dio/dio.dart';

class ApiClient {
  late final Dio dio;

  ApiClient() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://florin-eg.com/wp-json/wc/v3/',
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        headers: {'Accept': 'application/json'},
      ),
    );

    // Logging interceptor
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          print('Request: ${options.method} ${options.uri}');
          print('Headers: ${options.headers}');
          print('Data: ${options.data}');
          handler.next(options);
        },
        onResponse: (response, handler) {
          print('Response: ${response.statusCode} ${response.data}');
          handler.next(response);
        },
        onError: (DioException e, handler) {
          print('Error: ${e.type} ${e.message}');
          // Retry logic (simple example)
          if (e.type == DioExceptionType.connectionTimeout &&
              e.requestOptions.extra['retry'] == null) {
            e.requestOptions.extra['retry'] = true;
            dio
                .request(
                  e.requestOptions.path,
                  options: Options(
                    method: e.requestOptions.method,
                    headers: e.requestOptions.headers,
                  ),
                  data: e.requestOptions.data,
                  queryParameters: e.requestOptions.queryParameters,
                )
                .then((r) => handler.resolve(r))
                .catchError((err) => handler.reject(err));
            return;
          }
          handler.next(e);
        },
      ),
    );
  }
}
