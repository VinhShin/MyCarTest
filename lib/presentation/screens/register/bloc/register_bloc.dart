import 'package:flutter_bloc/flutter_bloc.dart';
import 'register_event.dart';
import 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitState()) {
    on<OnRegisterEvent>((event, emit) => emit(
        RegisterResultState(isSuccess: event.isDataValid(), errorMessage: '')));
  }
}
