import 'package:dio/dio.dart';
import 'package:latihan_dio/dio_interceptor.dart';

import '../../../../dio_client.dart';
import '/src/features/home/domain/user.dart';

enum RequestType { GET, POST, PUT, PATCH, DELETE }

class DioClient {
  final dio = createDio();

  DioClient._internal();

  static final _singleton = DioClient._internal();

  factory DioClient() => _singleton;

  static Dio createDio() {
    var dio = Dio(BaseOptions(
      baseUrl: "https://reqres.in/api/users?page=2",
      receiveTimeout: 20000, // 20 seconds
      connectTimeout: 20000,
      sendTimeout: 20000,
    ));

    // dio.interceptors.addAll({
    //   AuthInterceptor(dio),
    // });
    // dio.interceptors.addAll({
    //   Logging(dio),
    // });

    return dio;
  }

  Future<Response<dynamic>> apiCall({
    required String url,
    required RequestType requestType,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
    Map<String, String>? header,
    RequestOptions? requestOptions,
  }) async {
    late Response result;
    // try {
    switch (requestType) {
      case RequestType.GET:
        {
          Options options = Options(headers: header);
          result = await dio.get(url,
              queryParameters: queryParameters, options: options);
          break;
        }
      case RequestType.POST:
        {
          Options options = Options(headers: header);
          result = await dio.post(url, data: body, options: options);
          break;
        }
      case RequestType.DELETE:
        {
          Options options = Options(headers: header);
          result =
              await dio.delete(url, data: queryParameters, options: options);
          break;
        }
      case RequestType.PUT:
        {
          Options options = Options(headers: header);
          result = await dio.put(url, data: body, options: options);
          break;
        }
      case RequestType.PATCH:
        {
          Options options = Options(headers: header);
          result = await dio.patch(url, data: body, options: options);
          break;
        }
    }
    return result;
    //   if(result != null) {
    // //     return NetworkResponse.success(result.data);
    // //   } else {
    // //     return const NetworkResponse.error("Data is null");
    // //   }
    // // }on DioError catch (error) {
    // //   return NetworkResponse.error(error.message);
    // // } catch (error) {
    // //   return NetworkResponse.error(error.toString());
  }
}


// }