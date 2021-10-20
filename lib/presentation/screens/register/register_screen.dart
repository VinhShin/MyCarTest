import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';

import 'bloc/register_bloc.dart';
import 'bloc/register_event.dart';
import 'bloc/register_state.dart';
import '/common/contants/routes.dart';
import '/generated/locale_keys.g.dart';
import '/presentation/base_widget/m_app_bar.dart';
import '/presentation/custom_widget/button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String email = '';
  String password = '';
  String confirmPassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MAppBar(context),
      body: BlocProvider(
        create: (_) => RegisterBloc(),
        child: BlocConsumer<RegisterBloc, RegisterState>(
          listener: (context, state) {
            if (state is RegisterResultState) {
              if (state.isSuccess) {
                Navigator.pushNamedAndRemoveUntil(context, AppRoutes.homeScreen,
                    (Route<dynamic> route) => false);
              } else {
                _showRegisterError();
              }
            }
          },
          buildWhen: (context, state) => false,
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LocaleKeys.register_title.tr(),
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    SizedBox(height: 32),
                    TextField(
                      onChanged: (email) {
                        this.email = email;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: LocaleKeys.register_email_input.tr()),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      onChanged: (password) {
                        this.password = password;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: LocaleKeys.register_password_input.tr()),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      onChanged: (confirmPassword) {
                        this.confirmPassword = confirmPassword;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: LocaleKeys.register_confirm_password.tr()),
                    ),
                    SizedBox(height: 16),
                    Button(
                        isOutline: false,
                        onPress: () {
                          context.read<RegisterBloc>().add(OnRegisterEvent(
                              email: email,
                              password: password,
                              confirmPassword: confirmPassword));
                        },
                        text: LocaleKeys.register_button.tr()),
                    SizedBox(height: 40),
                    Html(
                        data: LocaleKeys.register_term_condition_desc.tr(),
                        onLinkTap: (String? url, RenderContext context,
                            Map<String, String> attributes, element) async {
                          if (url != null && await canLaunch(url)) {
                            await launch(url);
                          }
                        }),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _showRegisterError() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text(LocaleKeys.alert.tr()),
          content: Text(LocaleKeys.register_failure.tr()),
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
