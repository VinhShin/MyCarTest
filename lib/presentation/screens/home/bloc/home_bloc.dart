import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_car_test/presentation/screens/home/bloc/home_event.dart';
import 'package:my_car_test/presentation/screens/home/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInit());
}
