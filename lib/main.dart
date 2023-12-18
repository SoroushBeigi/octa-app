import 'package:flutter/material.dart';
import 'package:octa/core/routes.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(ResponsiveSizer(builder: (p0, p1, p2) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: Routes().routes,
    );
  }
}
