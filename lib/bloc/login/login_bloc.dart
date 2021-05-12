import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:the_coffe_collection/bloc/authentication/authentication_bloc.dart';
import 'package:the_coffe_collection/repositories/user_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({@required this.userRepository, @required this.authenticationBloc})
      : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginUser) {
      yield LoginLoading();

      LoginUser parsedEvent = event;

      try {
        await userRepository.login(
            parsedEvent.identifier, parsedEvent.password);

        authenticationBloc.add(LoggedIn());
        yield LoginInitial();
      } on DioError catch (error) {
        if (error.type != DioErrorType.response) {
          yield LoginError(reason: LoginErrorReason.noConnection);
          return;
        }

        String errorMessage = error.response.data;

        if (errorMessage == "error in username or password") {
          yield LoginError(reason: LoginErrorReason.invalidCredentials);
          return;
        }
      }
    }
  }
}
