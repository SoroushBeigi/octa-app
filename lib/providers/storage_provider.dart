import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  static SharedPreferences? _sharedPrefs;

  factory Storage() => Storage._internal();

  Storage._internal();

  Future<void> init() async {
    _sharedPrefs ??= await SharedPreferences.getInstance();
  }

  String? get token => _sharedPrefs!.getString('access_token') ?? '';
  String get refreshToken => _sharedPrefs!.getString('refresh_token') ?? '';
  String get userName => _sharedPrefs!.getString('user') ?? '';
  bool get loggedIn => _sharedPrefs!.getBool('loggedIn') ?? false;

  setToken(String type,String value) {
    _sharedPrefs!.setString(type, value);
  }

  setLoggedIn(){
    _sharedPrefs!.setBool('loggedIn', true);
  }

}

final storage = Storage();
