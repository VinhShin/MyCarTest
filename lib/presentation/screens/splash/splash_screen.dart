import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:my_car_test/common/assets/app_images.dart';
import 'package:my_car_test/common/contants/routes.dart';
import 'package:my_car_test/generated/locale_keys.g.dart';
import 'package:my_car_test/presentation/custom_widget/button.dart';
import 'package:my_car_test/presentation/screens/splash/widgets/user_info.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            image: DecorationImage(image: Image.asset(AppImages.splash).image)),
        child: Column(
          children: [
            Expanded(child: Image.asset(AppImages.logo)),
            UserInfo(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: Button(
                      onPress: () {
                        Navigator.pushNamed(context, AppRoutes.loginScreen);
                      },
                      text: LocaleKeys.login_login_label.tr(),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Button(
                      isOutline: false,
                      onPress: () {
                        Navigator.pushNamed(context, AppRoutes.registerScreen);
                      },
                      text: LocaleKeys.login_register_label.tr(),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
