abstract class HomeState {}

class HomeInitState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeDataState extends HomeState {
  List<String> items;
  HomeDataState(this.items);
}
