import 'package:dio/dio.dart';
// import 'networkData.dart';
import 'package:latihan_dio/dio_interceptor.dart';

enum RequestType { GET, POST, PUT, PATCH, DELETE }

class Api {
  final dio = createDio();

  Api._internal();

  static final _singleton = Api._internal();

  factory Api() => _singleton;

  static Dio createDio() {
    var dio = Dio(BaseOptions(
      baseUrl: "https:://api.call",
      receiveTimeout: 20000, // 20 seconds
      connectTimeout: 20000,
      sendTimeout: 20000,
    ));

    dio.interceptors.addAll({
      AuthInterceptor(dio),
    });
    dio.interceptors.addAll({
      Logging(dio),
    });

    return dio;
  }

  Future<Response?> apiCall(String url, Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? body, RequestType requestType) async {
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