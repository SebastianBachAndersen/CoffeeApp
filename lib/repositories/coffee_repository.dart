import 'package:dio/dio.dart';
import 'package:the_coffe_collection/Models/coffee.dart';
import 'package:the_coffe_collection/Models/coffee_rating.dart';
import 'package:the_coffe_collection/Models/user.dart';
import 'package:the_coffe_collection/enums/genre_enum.dart';
import 'package:the_coffe_collection/enums/serving_style.dart';
import 'package:the_coffe_collection/networking/api_provider.dart';
import 'package:the_coffe_collection/networking/api_provider.dart';

class CoffeeRepository {
  ApiProvider _provider = ApiProvider();

  Future<List<Coffee>> getCoffees() async {
    var response = await _provider.get('CoffeeContoller');

    return List.from(response.map((coffee) => Coffee.fromJson(coffee)));
  }

  Future<Coffee> createCoffee(String name, DateTime date, String genreName,
      String coffeeCompanyId) async {
    Map<String, dynamic> data = {
      'Name': name,
      'Date': date,
      'Genre': genreName,
      'CoffeeCompanyId': coffeeCompanyId
    };
    final response = await _provider.post('CoffeeContoller', jsonBody: data);
    return Coffee.fromJson(response);
  }

  Future<CoffeeRating> rateCoffee(double rating, DateTime date, String comment,
      String location, String coffeeId, ServingStyle servingStyle) async {
    Map<String, dynamic> data = {
      'rating': rating.toString(),
      'date': date.toIso8601String(),
      'comment': comment,
      'location': location,
      'coffeeId': coffeeId,
      'servingStyle': servingStyle.index
    };

    final response = await _provider.post("RateCoffee", jsonBody: data);
    return CoffeeRating.fromJson(response);
  }

  Future<User> getUserRatings() async {
    final response = await _provider.get('User/Ratings');
    return User.fromJson(response);
  }
}
