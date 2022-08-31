import 'package:dio/dio.dart';
import '/src/features/home/domain/user.dart';

abstract class Servics {
  static Future<User?> getData() async {}
}
