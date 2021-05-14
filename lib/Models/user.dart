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
        id: json['Id'],
        firstName: json['FirstName'],
        lastName: json['Lastname'],
        email: json['Email'],
        password: json['Password']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map();
    data['Id'] = this.id;
    data['FirstName'] = this.firstName;
    data['LastName'] = this.lastName;
    data['Email'] = this.email;
    data['Password'] = this.password;

    return data;
  }
}
