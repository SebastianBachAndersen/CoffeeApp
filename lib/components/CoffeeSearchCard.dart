import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:the_coffe_collection/Pages/rate_coffee_view.dart';
import 'package:the_coffe_collection/enums/genre_enum.dart';

class CoffeeSearchCard extends StatelessWidget {
  String coffeeName;
  String coffeeCompany;
  Genre coffeeGenre;
  CoffeeSearchCard({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => RateCoffeeView()));
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              leading: Image(
                image: AssetImage("assets/images/coffeePlaceholder.png"),
                fit: BoxFit.cover,
              ),
              title: Text("coffeeName"), //der skal noget ind her!
              subtitle: Text('TWICE'),
              trailing: Text("Rating: "),
            ),
          ],
        ),
      ),
    );
  }
}
