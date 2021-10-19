import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:my_car_test/common/assets/app_images.dart';
import 'package:my_car_test/data/template_data.dart';
import 'package:my_car_test/generated/locale_keys.g.dart';
import 'package:my_car_test/presentation/custom_widget/button.dart';
import 'package:my_car_test/presentation/custom_widget/user_info.dart';
import 'package:my_car_test/presentation/screens/home/bloc/home_bloc.dart';
import 'package:my_car_test/presentation/screens/home/bloc/home_state.dart';
import 'package:my_car_test/presentation/screens/home/widgets/browse_content.dart';

enum HomePart { header, content, loadMore }

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final items = [HomePart.header, HomePart.content, HomePart.loadMore];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (_) => HomeBloc(),
          child: BlocConsumer<HomeBloc, HomeState>(
            listener: (context, state) {},
            buildWhen: (context, state) => false,
            builder: (context, state) {
              return Padding(
                padding: EdgeInsets.all(20),
                child: CustomScrollView(slivers: [
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
                            Image.asset(AppImages.imageTemp1),
                            SizedBox(height: 16),
                            UserInfo(
                                userName: LocaleKeys.home_user_name,
                                userDescription: LocaleKeys.home_user_desc),
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
                            onPress: () {},
                          ),
                        );
                    }
                  }, childCount: items.length))
                ]),
              );
            },
          ),
        ),
      ),
    );
  }
}
