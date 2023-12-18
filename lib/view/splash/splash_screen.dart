import 'package:flutter/material.dart';
import 'package:octa/core/theme.dart';
import 'package:octa/view-model/splash_provider.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SplashProvider(),
      builder: (context, child) => const _SplashScreen(),
    );
  }
}

class _SplashScreen extends StatefulWidget {
  const _SplashScreen({super.key});

  @override
  State<_SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<_SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<SplashProvider>();
    if (!provider.isLoaded) provider.load(context);
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Column(
          children: [
            Image.asset('assets/splash.png',
                width: 100.w, fit: BoxFit.fitWidth),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'Octa App',
              style: MyTheme.splashText,
            ),
          ],
        ),
      ),
    );
  }
}
