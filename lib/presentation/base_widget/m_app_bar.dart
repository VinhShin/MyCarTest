import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '/common/assets/app_icons.dart';

class MAppBar extends AppBar {
  MAppBar(BuildContext context)
      : super(
          elevation: 0,
          leading: InkWell(
            child: SvgPicture.asset(
              AppIcons.back,
              width: 40,
              height: 40,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        );
}
