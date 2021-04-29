part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginError extends LoginState {
  final LoginErrorReason reason;

  LoginError({@required this.reason});

  @override
  List<Object> get props => [reason];
}

enum LoginErrorReason {
  invalidCredentials,
  noConnection,
}
