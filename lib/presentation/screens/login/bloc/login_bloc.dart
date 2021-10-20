import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitState()) {
    on<OnLoginEvent>((event, emit) => emit(LoginResultState(
        isSuccess: event.email.isNotEmpty && event.password.isNotEmpty,
        errorMessage: '')));
  }
}
