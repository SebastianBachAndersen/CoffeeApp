part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginUser extends LoginEvent {
  final String identifier;
  final String password;
  final bool rememberMe;

  const LoginUser({
    @required this.identifier,
    @required this.password,
    @required this.rememberMe,
  });

  @override
  List<Object> get props => [identifier, password, rememberMe];

  @override
  String toString() =>
      'LoginEmployee { identifier: $identifier, password: $password, rememberMe: $rememberMe }';
}
