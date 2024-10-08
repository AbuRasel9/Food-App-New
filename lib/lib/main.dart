import 'package:flutter/material.dart';
import 'package:foodly_ui/lib/core/provider/auth_provider.dart';
import 'package:foodly_ui/lib/core/service/service_locator.dart';
import 'package:foodly_ui/lib/utils/constants.dart';
import 'package:foodly_ui/lib/utils/theme/app_theme_data.dart';
import 'package:provider/provider.dart';

import 'core/view/onboarding/onboarding_scrreen.dart';


void main() {
  diSetup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application. dd
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context)=>AuthProvider())
    ],child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The Flutter Way - Foodly UI Kit',
      theme: AppThemeData.lightThemeData,

      home: const OnboardingScreen(),
    ),);
  }
}
