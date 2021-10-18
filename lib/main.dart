import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // routes: {
      //   // When navigating to the "/" route, build the FirstScreen widget.
      //   '/': (context) => const LoginScreen(),
      //   // When navigating to the "/second" route, build the SecondScreen widget.
      //   PBRouter.homeScreen: (context) => const HomeScreen(),
      //   PBRouter.photoScreen: (context) => const PhotoScreen(),
      // },
      home: SplashScreen(),
    );
  }
}
