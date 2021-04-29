import 'package:equatable/equatable.dart';

class LoginResult extends Equatable {
  final String userId;
  final String userName;
  final String token;

  LoginResult({this.userId, this.userName, this.token});

  @override
  List<Object> get props => [userId, userName, token];

  factory LoginResult.fromJson(Map<String, dynamic> json) {
    return LoginResult(
        userId: json['userId'],
        userName: json['userName'],
        token: json['token']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map();

    data['userId'] = this.userId;
    data['userName'] = this.userName;
    data['token'] = this.token;

    return data;
  }
}
