import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:my_car_test/common/app_theme.dart';
import 'package:my_car_test/common/contants/routes.dart';
import 'package:my_car_test/presentation/screens/intro/intro_screen.dart';
import 'package:my_car_test/presentation/screens/login/login_screen.dart';
import 'package:my_car_test/presentation/screens/register/register_screen.dart';

import 'presentation/screens/home/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en', ''), Locale('vi', '')],
        fallbackLocale: Locale('vi', ''),
        path: 'assets/languages',
        useOnlyLangCode: true,
        child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Car Test',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      routes: {
        AppRoutes.introScreen: (context) => const IntroScreen(),
        AppRoutes.homeScreen: (context) => const HomeScreen(),
        AppRoutes.loginScreen: (context) => const LoginScreen(),
        AppRoutes.registerScreen: (context) => const RegisterScreen(),
      },
    );
  }
}
