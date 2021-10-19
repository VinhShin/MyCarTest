import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_car_test/data/template_data.dart';
import 'package:my_car_test/presentation/screens/home/bloc/home_event.dart';
import 'package:my_car_test/presentation/screens/home/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final items = TemplateData.dataPage1;
  int page = 1;

  HomeBloc() : super(HomeDataState(TemplateData.dataPage1)) {
    on<HomeLoadMoreEvent>((event, emit) => _loadContent(emit));
  }

  // fake logic call api
  void _loadContent(Emitter<HomeState> emit) async {
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
