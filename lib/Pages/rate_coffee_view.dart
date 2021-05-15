import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'landing_page.dart';

class RateCoffeeView extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<RateCoffeeView> {
  List<String> images = [
    "https://placeimg.com/500/500/any",
    "https://placeimg.com/500/500/any",
    "https://placeimg.com/500/500/any",
    "https://placeimg.com/500/500/any",
    "https://placeimg.com/500/500/any"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff49281A),
        title: const Text('RateCoffeeView'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Flexible(
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 8.0,
                children: <Widget>[
                  Image.asset('assets/images/coffeePlaceholder.jpg'),
                ],
              ),
            ),
            Divider(color: Colors.black),
            RatingBar.builder(
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
          ],
        ),
      ),
    );
  }
}
