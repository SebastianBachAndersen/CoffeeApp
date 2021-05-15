import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String password;

  User({this.id, this.firstName, this.lastName, this.email, this.password});

  @override
  List<Object> get props => [
        id,
        firstName,
      ];

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        firstName: json['firstName'],
        lastName: json['lastname'],
        email: json['email'],
        password: json['password']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['password'] = this.password;

    return data;
  }
}
