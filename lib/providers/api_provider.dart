import 'package:dio/dio.dart';
import 'package:octa/model/invoice_model.dart';
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
      storage.setToken('access_token', response.data['access_token']);
      storage.setToken('refresh_token', response.data['refresh_token']);
      storage.setToken('user', userName);
      return null;
    } on DioException catch (e) {
      if (e.response == null) {
        return 'Something wrong happened';
      }
      if (e.response!.statusCode == 400) {
        return 'Wrong username or password.';
      }
      return 'error';
    }
  }

  Future<List<Invoice>?> loadInvoices() async {
    try {
      final response = await _dio.get(
        'https://octa-query.liara.run/GetSellInvoicesByCustomerId?customerCode=${storage.userName}',
        // options:
        //     Options(contentType: Headers.formUrlEncodedContentType, headers: {
        //   'Content-Type': 'application/x-www-form-urlencoded',
        // }),
      );
      final List<Invoice> fetchedInvoices =
          (response.data['sellInvoiceRMs'] as List)
              .map((e) => Invoice.fromJson(e))
              .toList();
              return fetchedInvoices;
    } catch (e) {
      return null;
    }
  }
}
