abstract class RegisterEvent {}

class OnRegisterEvent extends RegisterEvent {
  final String email;
  final String password;
  final String confirmPassword;

  bool isDataValid() {
    return email.isNotEmpty &&
        password.isNotEmpty &&
        confirmPassword.isNotEmpty &&
        (password == confirmPassword);
  }

  OnRegisterEvent(
      {required this.email,
      required this.password,
      required this.confirmPassword});
}
