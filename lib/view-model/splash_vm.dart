import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashProvider extends ChangeNotifier{
   late Timer _timer;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  void load(BuildContext context) {
    _timer = Timer(const Duration(seconds: 3), () {
      _isLoaded = true;
      context.pushReplacement('/login');
      _timer.cancel();
    });
  }
}