import 'package:dio/dio.dart';

class ApiResponse<T> {
  final T data;
  final Response response;

  ApiResponse({
    required this.data,
    required this.response,
  });
}
