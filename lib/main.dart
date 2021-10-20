import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'common/app_theme.dart';
import 'common/contants/routes.dart';
import 'presentation/screens/home/home_screen.dart';
import 'presentation/screens/intro/intro_screen.dart';
import 'presentation/screens/login/login_screen.dart';
import 'presentation/screens/register/register_screen.dart';

void main() async {
  while (Platform.localeName == null) {
    await Future.delayed(const Duration(microseconds: 300), () {});
  }
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en', 'US'), Locale('vi', 'VN')],
        fallbackLocale: Locale('vi', 'VN'),
        path: 'assets/languages',
        child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
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
