import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_coffe_collection/bloc/authentication/authentication_bloc.dart';
import 'package:the_coffe_collection/bloc/login/login_bloc.dart';
import 'package:the_coffe_collection/repositories/user_repository.dart';

import 'login.dart';

class LoginRoute extends StatelessWidget {
  LoginRoute({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return LoginBloc(
          userRepository: RepositoryProvider.of<UserRepository>(context),
          authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
        );
      },
      child: LoginPage(),
    );
  }
}
