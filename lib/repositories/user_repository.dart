import 'package:the_coffe_collection/Models/login_result.dart';
import 'package:the_coffe_collection/Models/user.dart';
import 'package:the_coffe_collection/networking/api_provider.dart';

class UserRepository {
  ApiProvider _provider = ApiProvider();

  Future<bool> verifyUserLoggedIn() async {
    await _provider.get('status');
    return true;
  }

  Future<LoginResult> login(
      String identifier, String password, bool rememberMe) async {
    Map<String, dynamic> data = {
      'identifier': identifier,
      'password': password,
      'rememberMe': rememberMe
    };

    final response = await _provider.post('login', jsonBody: data);
    return LoginResult.fromJson(response);
  }

  Future<void> logout() async {
    await _provider.get('logout');
  }

  Future<User> getAuthenticatedUser() async {
    final response = await _provider.get('employees/current');
    return User.fromJson(response);
  }
}
