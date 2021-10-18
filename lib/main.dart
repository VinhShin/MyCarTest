import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:my_car_test/common/app_theme.dart';
import 'package:my_car_test/common/contants/routes.dart';
import 'package:my_car_test/presentation/screens/login/login_screen.dart';

import 'presentation/screens/home/home_screen.dart';
import 'presentation/screens/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en', ''), Locale('vi', '')],
        path: 'assets/languages',
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
      routes: {
        AppRoutes.splashScreen: (context) => const SplashScreen(),
        AppRoutes.homeScreen: (context) => const HomeScreen(),
        AppRoutes.loginScreen: (context) => const LoginScreen(),
      },
    );
  }
}
