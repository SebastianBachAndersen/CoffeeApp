class Coffee {
  String id;
  String name;
  DateTime date;
  String genreName;
  String coffeeCompanyId;
  String coffeeCompanyName;
  double averageRating;
  String imageLink;

  Coffee(
      {this.id,
      this.name,
      this.date,
      this.genreName,
      this.coffeeCompanyId,
      this.coffeeCompanyName,
      this.averageRating,
      this.imageLink});

  Coffee.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    date = DateTime.tryParse(json['date']);
    genreName = json['genreName'];
    coffeeCompanyId = json['coffeeCompanyId'];
    coffeeCompanyName = json['coffeeCompanyName'];
    averageRating = json['averageRating'].toDouble();
    imageLink = json['imageLink'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['date'] = this.date.toIso8601String();
    data['genreName'] = this..genreName;
    data['coffeeCompanyId'] = this.coffeeCompanyId;
    data['coffeeCompanyName'] = this.coffeeCompanyName;
    data['averageRating'] = this.averageRating.toString();
    data['imageLink'] = this.imageLink;
    return data;
  }
}
