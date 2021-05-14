import 'coffee.dart';

class Company {
  String id;
  String name;
  String address;
  List<Coffee> coffee;

  Company({this.id, this.name, this.address, this.coffee});

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    if (json['coffee'] != null) {
      coffee = <Coffee>[];
      json['coffee'].forEach((v) {
        coffee.add(new Coffee.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['address'] = this.address;
    if (this.coffee != null) {
      data['coffee'] = this.coffee.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
