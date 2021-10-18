import 'package:flutter/material.dart';
import 'package:my_car_test/common/assets/app_images.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Image.asset(AppImages.avatar),
      Column(children: [
        Text(
          "Pawel Czerwinski",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text("@pawel_czerwinski"),
      ]),
    ]);
  }
}
