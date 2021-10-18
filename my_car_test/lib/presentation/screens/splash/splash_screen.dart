import 'package:flutter/material.dart';
import 'package:my_car_test/common/assets/app_images.dart';
import 'package:my_car_test/presentation/custom_widget/button.dart';
import 'package:my_car_test/presentation/screens/widgets/user_info.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

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
                      onPress: () {},
                      text: "LOGIN",
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Button(
                      isOutline: false,
                      onPress: () {},
                      text: "REGISTER",
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
