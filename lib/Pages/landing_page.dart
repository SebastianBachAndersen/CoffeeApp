import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_coffe_collection/Pages/authenticated_page.dart';
import 'package:the_coffe_collection/Pages/login_route.dart';
import 'package:the_coffe_collection/bloc/authentication/authentication_bloc.dart';

class LandingPage extends StatelessWidget {
  LandingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticationAuthenticated) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => AuthenticatedPage()));
        }
      },
      child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
        if (state is AuthenticationUnauthenticated) {
          return LoginRoute();
        }

        return Material(
          child: Container(
            decoration: BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.5)),
            child: Center(child: CircularProgressIndicator()),
          ),
        );
      }),
    );
  }
}
