import 'package:the_coffe_collection/Models/login_result.dart';
import 'package:the_coffe_collection/Models/user.dart';
import 'package:the_coffe_collection/networking/api_provider.dart';
import 'package:the_coffe_collection/utils/shared_preferences.dart';

class UserRepository {
  ApiProvider _provider = ApiProvider();

  Future<bool> verifyUserLoggedIn() async {
    var response = await _provider.get('Login/Status');
    if (response == "") {
      return false;
    }
    return true;
  }

  Future<User> login(String identifier, String password) async {
    Map<String, dynamic> data = {'Email': identifier, 'Password': password};
    SharedPreference token = new SharedPreference();
    final response = await _provider.post('Login', jsonBody: data);
    await token.save(response['token']);
    print(await token.read());
    return User.fromJson(response['user']);
  }

  Future<void> logout() async {
    await _provider.get('logout');
  }

  Future<User> getAuthenticatedUser() async {
    final response = await _provider.get('Login');
    SharedPreference token = new SharedPreference();
    print(await token.read());
    return User.fromJson(response);
  }
}
