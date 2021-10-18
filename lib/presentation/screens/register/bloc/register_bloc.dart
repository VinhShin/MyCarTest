import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_car_test/presentation/screens/register/bloc/register_event.dart';
import 'package:my_car_test/presentation/screens/register/bloc/register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitState()) {
    on<OnRegisterEvent>((event, emit) => emit(
        RegisterResultState(isSuccess: event.isDataValid(), errorMessage: '')));
  }
}
