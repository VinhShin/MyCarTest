abstract class LoginState {}

class LoginInitState extends LoginState {}

class LoginResultState extends LoginState {
  final bool isSuccess;
  final String errorMessage;

  LoginResultState({required this.isSuccess, required this.errorMessage});
}
