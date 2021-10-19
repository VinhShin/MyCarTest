import 'package:flutter/material.dart';
import 'package:my_car_test/common/assets/app_images.dart';

class UserInfo extends StatelessWidget {
  final userName;
  final userDescription;

  const UserInfo(
      {required this.userName, required this.userDescription, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Image.asset(AppImages.avatar),
      Column(children: [
        Text(
          userName,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(userDescription),
      ]),
    ]);
  }
}
