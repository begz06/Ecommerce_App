import 'package:dio/dio.dart';

class DioSettings {
  final BaseOptions _dioBaseOptions = BaseOptions(
    // baseUrl: "https://reqres.in",
    connectTimeout: const Duration(seconds: 55),
    receiveTimeout: const Duration(seconds: 55),
    sendTimeout: const Duration(seconds: 55),
    responseType: ResponseType.json,
    followRedirects: false,
    validateStatus: (status) => status != null && status > 100 && status <= 599,
  );
  Dio get dio => Dio(_dioBaseOptions);
}
