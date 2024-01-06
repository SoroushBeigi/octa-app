import 'package:dio/dio.dart';
import 'package:octa/core/constants.dart';

class ApiProvider {
  final Dio _dio = Dio();
  Future<String?> login(String userName, String password) async {
    try {
      _dio.post(
        Constants.baseURL + Constants.loginEndpoint,
        data: {
          'client_id': 'flutter',
          'client_secret': 'fluttersecret',
          'username': userName,
          'password': password,
          'grant_type': 'password',
        },
        options: Options(contentType: Headers.formUrlEncodedContentType),
      );
      return null;
    } on DioException catch (e) {
      if(e.response==null){
        return 'Something wrong happened';
      }
      if(e.response!.statusCode==400){
        return 'Wrong username or password.';
      }
    }
  }
}
