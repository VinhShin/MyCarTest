import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_car_test/presentation/custom_widget/full_loading.dart';
import 'package:my_car_test/presentation/screens/home/bloc/home_event.dart';
import 'package:my_car_test/presentation/screens/home/widgets/home_bottom_bar.dart';
import 'package:my_car_test/presentation/screens/home/bloc/home_bloc.dart';
import 'package:my_car_test/presentation/screens/home/bloc/home_state.dart';
import 'package:my_car_test/presentation/screens/home/pages/comment_page.dart';
import 'package:my_car_test/presentation/screens/home/pages/profile_page.dart';
import 'package:my_car_test/presentation/screens/home/pages/search_page.dart';

import 'pages/home_page.dart';

enum HomePart { header, content, loadMore }

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => HomeBloc(),
        child: Stack(
          children: [
            SafeArea(
              child: Padding(
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 80),
                child: BlocBuilder<HomeBloc, HomeState>(
                    buildWhen: (oldState, newState) {
                  return newState is HomePageState;
                }, builder: (context, state) {
                  if (state is HomePageState) {
                    switch (state.page) {
                      case HomePageIndex.home:
                        return HomePage();
                      case HomePageIndex.search:
                        return SearchPage();
                      case HomePageIndex.comment:
                        return CommentPage();
                      default:
                        return ProfilePage();
                    }
                  }
                  return Container();
                }),
              ),
            ),
            HomeBottomBar(),
            BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
              if (state is HomeLoadingState) {
                return FullLoading(true);
              }
              return Container();
            })
          ],
        ),
      ),
    );
  }
}
