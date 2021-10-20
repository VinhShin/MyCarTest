import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/common/assets/app_images.dart';
import '/generated/locale_keys.g.dart';
import '/presentation/custom_widget/button.dart';
import '/presentation/custom_widget/user_info.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../widgets/browse_content.dart';
import '../home_screen.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final items = const [HomePart.header, HomePart.content, HomePart.loadMore];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<HomeBloc>().add(HomeInitEvent());
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
        switch (items[index]) {
          case HomePart.header:
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LocaleKeys.home_home_title.tr(),
                  style: Theme.of(context).textTheme.headline1,
                ),
                SizedBox(height: 32),
                Text(
                  LocaleKeys.home_what_is_new_today.tr(),
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(fontWeight: FontWeight.w900),
                ),
                SizedBox(height: 24),
                Align(
                    alignment: AlignmentDirectional.center,
                    child: Image.asset(AppImages.imageTemp1)),
                SizedBox(height: 16),
                UserInfo(
                    userName: LocaleKeys.home_user_name.tr(),
                    userDescription: LocaleKeys.home_user_desc.tr()),
                SizedBox(height: 48),
                Text(
                  LocaleKeys.home_browser_all.tr(),
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(fontWeight: FontWeight.w900),
                ),
                SizedBox(height: 24),
              ],
            );

          case HomePart.content:
            return BrowseAllContent();
          default:
            return Padding(
                padding: const EdgeInsets.only(top: 32),
                child: Button(
                    text: LocaleKeys.home_see_more.tr(),
                    onPress: () {
                      context.read<HomeBloc>().add(HomeLoadMoreEvent());
                    }));
        }
      }, childCount: items.length))
    ]);
  }
}
