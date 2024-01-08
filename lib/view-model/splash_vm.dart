import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:octa/providers/storage_provider.dart';

class SplashProvider extends ChangeNotifier {
  late Timer _timer;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  void load(BuildContext context) {
    _timer = Timer(const Duration(seconds: 3), () {
      _isLoaded = true;
      if (storage.loggedIn) {
        context.pushReplacement('/home');
      } else {
        context.pushReplacement('/login');
      }
      _timer.cancel();
    });
  }
}
