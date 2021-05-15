import 'package:the_coffe_collection/enums/serving_style.dart';

class CoffeeRating {
  String id;
  double rating;
  DateTime date;
  String comment;
  String location;
  String coffeeId;
  ServingStyle serveringStyle;

  CoffeeRating(
      {this.id,
      this.rating,
      this.date,
      this.comment,
      this.location,
      this.coffeeId,
      this.serveringStyle});

  CoffeeRating.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rating = json['rating'].toDouble();
    date = DateTime.tryParse(json['date']);
    comment = json['comment'];
    location = json['location'];
    coffeeId = json['coffeeId'];
    serveringStyle = ServingStyle.values[json['serveringStyle']];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['rating'] = this.rating.toString();
    data['date'] = this.date.toIso8601String();
    data['comment'] = this.comment;
    data['location'] = this.location;
    data['coffeeId'] = this.coffeeId;
    data['serveringStyle'] = this.serveringStyle.index;
    return data;
  }
}
