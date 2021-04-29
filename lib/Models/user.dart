import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String userId;
  final String username;
  final String firstName;
  final String lastName;
  final String email;

  User({this.userId, this.username, this.firstName, this.lastName, this.email});

  @override
  List<Object> get props => [
        userId,
        firstName,
      ];

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        userId: json['userId'],
        username: json['username'],
        firstName: json['firstName'],
        lastName: json['lastname'],
        email: json['email']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map();

    data['userId'] = this.userId;
    data['username'] = this.username;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;

    return data;
  }
}
