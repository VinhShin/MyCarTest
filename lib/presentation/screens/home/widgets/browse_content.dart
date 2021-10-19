import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:my_car_test/presentation/screens/home/bloc/home_bloc.dart';
import 'package:my_car_test/presentation/screens/home/bloc/home_state.dart';

class BrowseAllContent extends StatelessWidget {
  const BrowseAllContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (oldState, newState) {
        return newState is HomeDataState;
      },
      builder: (context, state) {
        if (state is HomeDataState) {
          final items = state.items;
          return StaggeredGridView.countBuilder(
            crossAxisCount: 2,
            itemCount: items.length,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) => Image.asset(
              items[index],
              fit: BoxFit.fill,
            ),
            staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
            mainAxisSpacing: 9.0,
            crossAxisSpacing: 9.0,
          );
        }
        return Container();
      },
    );
  }
}
