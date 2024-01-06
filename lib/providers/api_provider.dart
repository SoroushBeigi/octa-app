import 'package:dio/dio.dart';
import 'package:octa/providers/storage_provider.dart';

class ApiProvider {
  final Dio _dio = Dio();
  Future<String?> login(String userName, String password) async {
    try {
    final response = await _dio.post(
      'https://octa-auth.liara.run/connect/token',
      data: {
        'client_id': 'flutter',
        'client_secret': 'fluttersecret',
        'username': userName,
        'password': password,
        'grant_type': 'password',
      },
      options:
          Options(contentType: Headers.formUrlEncodedContentType, headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      }),
    );
    storage.setToken('access_token',response.data['access_token']);
    storage.setToken('refresh_token',response.data['refresh_token']);
    return null;
    } on DioException catch (e) {
      if(e.response==null){
        return 'Something wrong happened';
      }
      if(e.response!.statusCode==400){
        return 'Wrong username or password.';
      }
      return 'error';
    }
  }
}
