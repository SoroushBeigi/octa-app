import 'package:flutter/material.dart';
import 'package:octa/providers/api_provider.dart';

class LoginProvider extends ChangeNotifier {
  final _apiProvider = ApiProvider();
  Future<String?> login(String userName, String password) =>
      _apiProvider.login(userName, password);

  Future<String?> register() async {}
}
