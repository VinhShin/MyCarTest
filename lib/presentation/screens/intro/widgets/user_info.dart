import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:my_car_test/common/assets/app_images.dart';
import 'package:my_car_test/generated/locale_keys.g.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Image.asset(AppImages.avatar),
      Column(children: [
        Text(
          LocaleKeys.intro_user_title.tr(),
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(LocaleKeys.intro_user_desc.tr()),
      ]),
    ]);
  }
}
