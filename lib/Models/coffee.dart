import 'package:equatable/equatable.dart';
import 'package:the_coffe_collection/enums/genre_enum.dart';

import 'coffee_rating.dart';

class Coffee {
  String id;
  String name;
  DateTime date;
  Genre genre;
  String coffeeCompanyId;
  List<CoffeeRating> coffeeRating;

  Coffee(
      {this.id,
      this.name,
      this.date,
      this.genre,
      this.coffeeCompanyId,
      this.coffeeRating});

  Coffee.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    date = DateTime.tryParse(json['date']);
    genre = Genre.values[json['genre']];
    coffeeCompanyId = json['coffeeCompanyId'];
    if (json['coffeeRating'] != null) {
      coffeeRating = <CoffeeRating>[];
      json['coffeeRating'].forEach((v) {
        coffeeRating.add(new CoffeeRating.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['date'] = this.date.toIso8601String();
    data['genre'] = this.genre.index;
    data['coffeeCompanyId'] = this.coffeeCompanyId;
    if (this.coffeeRating != null) {
      data['coffeeRating'] = this.coffeeRating.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
