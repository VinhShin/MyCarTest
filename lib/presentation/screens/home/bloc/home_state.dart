enum HomePageIndex { home, search, add, comment, profile }

abstract class HomeState {
  HomeState();
}

class HomePageState extends HomeState {
  var page;
  HomePageState({required this.page});
}

class HomeLoadingState extends HomeState {}

class HomeDataState extends HomeState {
  List<String> items;
  HomeDataState(this.items);
}
