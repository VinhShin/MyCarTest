abstract class RegisterState {}

class RegisterInitState extends RegisterState {}

class RegisterResultState extends RegisterState {
  final bool isSuccess;
  final String errorMessage;

  RegisterResultState({required this.isSuccess, required this.errorMessage});
}
