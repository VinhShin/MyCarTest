import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_car_test/data/template_data.dart';
import 'package:my_car_test/presentation/screens/home/bloc/home_event.dart';
import 'package:my_car_test/presentation/screens/home/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final items = <String>[];
  int page = 0;

  HomeBloc() : super(HomePageState(page: HomePageIndex.home)) {
    on<HomeInitEvent>((event, emit) async {
      page = 0;
      items.clear();
      await _loadContent(emit);
    });
    on<HomePageChangeEvent>(
        (event, emit) => emit(HomePageState(page: event.homePageIndex)));
    on<HomeLoadMoreEvent>((event, emit) async => await _loadContent(emit));
  }

  // fake logic call api
  Future<void> _loadContent(Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 1));
    var itemRes = <String>[];
    page++;
    switch (page) {
      case 1:
        itemRes = TemplateData.dataPage1;
        break;
      case 2:
        itemRes = TemplateData.dataPage2;
        break;
      case 3:
        itemRes = TemplateData.dataPage3;
        break;
      default:
        itemRes = TemplateData.dataPage4;
    }
    items.addAll(itemRes);
    emit(HomeDataState(items));
  }
}
