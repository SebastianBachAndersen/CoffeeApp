part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginUser extends LoginEvent {
  final String identifier;
  final String password;

  const LoginUser({@required this.identifier, @required this.password});

  @override
  List<Object> get props => [identifier, password];

  @override
  String toString() =>
      'LoginEmployee { identifier: $identifier, password: $password}';
}
