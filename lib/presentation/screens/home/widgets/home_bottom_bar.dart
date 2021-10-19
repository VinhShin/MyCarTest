import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_car_test/common/assets/app_icons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_car_test/presentation/screens/home/bloc/home_bloc.dart';
import 'package:my_car_test/presentation/screens/home/bloc/home_event.dart';
import 'package:my_car_test/presentation/screens/home/bloc/home_state.dart';

class HomeBottomBar extends StatelessWidget {
  const HomeBottomBar({Key? key}) : super(key: key);

  Widget _getBottomItem(
      BuildContext context, String iconPath, HomePageIndex page) {
    return InkWell(
        onTap: () {
          context
              .read<HomeBloc>()
              .add(HomePageChangeEvent(homePageIndex: page));
        },
        child: SvgPicture.asset(iconPath));
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.bottomCenter,
      child: SafeArea(
        child: Container(
          height: 70,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 0.5,
                color: Colors.grey,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _getBottomItem(context, AppIcons.home, HomePageIndex.home),
                    _getBottomItem(
                        context, AppIcons.search, HomePageIndex.search),
                    SvgPicture.asset(AppIcons.homeAdd),
                    _getBottomItem(
                        context, AppIcons.comment, HomePageIndex.comment),
                    _getBottomItem(
                        context, AppIcons.profile, HomePageIndex.profile),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
