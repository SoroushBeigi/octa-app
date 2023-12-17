import 'package:flutter/material.dart';
import 'package:octa/view-model/login_provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (_) => LoginProvider(),
    builder: (context, child) => const _LoginScreen(),);
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
    return const Placeholder();
  }
}
