import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_car_test/common/contants/routes.dart';
import 'package:my_car_test/generated/locale_keys.g.dart';
import 'package:my_car_test/presentation/base_widget/m_app_bar.dart';
import 'package:my_car_test/presentation/custom_widget/button.dart';
import 'package:my_car_test/presentation/screens/login/bloc/login_bloc.dart';
import 'package:my_car_test/presentation/screens/login/bloc/login_event.dart';

import 'bloc/login_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MAppBar(context),
      body: BlocProvider(
        create: (_) => LoginBloc(),
        child: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginResultState) {
              if (state.isSuccess) {
                Navigator.pushNamed(context, AppRoutes.homeScreen);
              } else {
                _showLoginError();
              }
            }
          },
          buildWhen: (context, state) => false,
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LocaleKeys.login_login_title.tr(),
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  SizedBox(height: 32),
                  TextField(
                    onChanged: (email) {
                      this.email = email;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: LocaleKeys.login_email_input.tr()),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    onChanged: (password) {
                      this.password = password;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: LocaleKeys.login_password_input.tr()),
                  ),
                  SizedBox(height: 16),
                  Button(
                      isOutline: false,
                      onPress: () {
                        context.read<LoginBloc>().add(
                            OnLoginEvent(email: email, password: password));
                      },
                      text: LocaleKeys.login_login_button.tr())
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _showLoginError() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text(LocaleKeys.alert.tr()),
          content: Text(LocaleKeys.login_password_incorrect.tr()),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(LocaleKeys.ok.tr()),
            )
          ],
        );
      },
    );
  }
}
