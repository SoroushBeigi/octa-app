import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart' hide LoginProvider;
import 'package:go_router/go_router.dart';
import 'package:octa/view-model/login_vm.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginProvider(),
      builder: (context, child) => const _LoginScreen(),
    );
  }
}

class _LoginScreen extends StatefulWidget {
  const _LoginScreen({super.key});

  @override
  State<_LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<_LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<LoginProvider>();
    return FlutterLogin(
      userType: LoginUserType.name,
      userValidator: (value) => null,
      title: 'Octa',
      onLogin: (p0) => provider.login(p0.name,p0.password),
      onSignup:(p0) => provider.register(),
      onSubmitAnimationCompleted: () {
        context.pushReplacement('/home');
      },
      onRecoverPassword: (p0) {},
    );
  }
}
