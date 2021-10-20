import '/presentation/screens/home/bloc/home_state.dart';

abstract class HomeEvent {}

class HomeInitEvent extends HomeEvent {}

class HomeLoadMoreEvent extends HomeEvent {}

class HomePageChangeEvent extends HomeEvent {
  final HomePageIndex homePageIndex;
  HomePageChangeEvent({required this.homePageIndex});
}
