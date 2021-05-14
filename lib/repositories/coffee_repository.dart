import 'package:dio/dio.dart';
import 'package:the_coffe_collection/Models/coffee.dart';
import 'package:the_coffe_collection/enums/genre_enum.dart';
import 'package:the_coffe_collection/networking/api_provider.dart';
import 'package:the_coffe_collection/networking/api_provider.dart';

class CoffeeRepository {
  ApiProvider _provider = ApiProvider();

  Future<List<Coffee>> getCoffees() async {
    var response = await _provider.get('CoffeeController');

    return List.from(response.map((coffee) => Coffee.fromJson(coffee)));
  }

  Future<Coffee> createCoffee(
      String name, DateTime date, Genre genre, String coffeeCompanyId) async {
    Map<String, dynamic> data = {
      'Name': name,
      'Date': date,
      'Genre': genre.index,
      'CoffeeCompanyId': coffeeCompanyId
    };
    final response = await _provider.post('CoffeeController', jsonBody: data);
    return Coffee.fromJson(response);
  }
}
