import 'package:equatable/equatable.dart';
import 'package:the_coffe_collection/Models/coffee_rating.dart';

class User extends Equatable {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final int numberOfRatings;
  final int numberOfTypesRated;
  final List<CoffeeRating> coffeeRatings;

  User(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.numberOfRatings,
      this.numberOfTypesRated,
      this.coffeeRatings});

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
        numberOfRatings: json['coffeeRatings'],
        numberOfTypesRated: json['coffeeTypes'],
        coffeeRatings: json['coffeeRating'] != null
            ? List<CoffeeRating>.from(json['coffeeRating']
                .map((coffeerating) => CoffeeRating.fromJson(coffeerating)))
            : null);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['coffeeRating'] = this
        .coffeeRatings
        .map((coffeerating) => coffeerating.toJson())
        ?.toList();

    return data;
  }
}
