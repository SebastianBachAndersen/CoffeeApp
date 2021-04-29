import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:the_coffe_collection/Models/user.dart';
import 'package:the_coffe_collection/repositories/user_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;

  AuthenticationBloc({@required this.userRepository})
      : super(AuthenticationInitial());

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      try {
        final bool loggedIn = await userRepository.verifyUserLoggedIn();
        if (loggedIn) {
          var currentUser = await userRepository.getAuthenticatedUser();
          yield AuthenticationAuthenticated(user: currentUser);
        }
      } on DioError {
        // TODO: Also check for connection issues & show a "no connection" error if they occur
        yield AuthenticationUnauthenticated();
      }
    }

    if (event is LoggedIn) {
      var currentUser = await userRepository.getAuthenticatedUser();
      yield AuthenticationAuthenticated(user: currentUser);
    }

    if (event is LoggedOut) {
      yield AuthenticationLoading();
      await userRepository.logout();
      yield AuthenticationUnauthenticated();
    }
  }
}
