import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_car_test/generated/locale_keys.g.dart';
import 'package:my_car_test/presentation/base_widget/m_app_bar.dart';
import 'package:my_car_test/presentation/custom_widget/button.dart';
import 'package:my_car_test/presentation/screens/home/bloc/home_bloc.dart';
import 'package:my_car_test/presentation/screens/home/bloc/home_state.dart';
import 'package:my_car_test/presentation/screens/login/bloc/login_bloc.dart';
import 'package:my_car_test/presentation/screens/login/bloc/login_event.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MAppBar(context),
      body: BlocProvider(
        create: (_) => HomeBloc(),
        child: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {},
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
}
