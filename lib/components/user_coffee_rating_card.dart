import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:the_coffe_collection/Models/coffee_rating.dart';
import 'package:the_coffe_collection/enums/serving_style.dart';

Widget userRatingCard(CoffeeRating coffeeRating, String name) {
  return Container(
    color: Colors.brown,
    child: Card(
      child: Column(
        children: [
          Row(
            children: [
              Container(
                margin: new EdgeInsets.symmetric(horizontal: 5.0),
                child: Image(
                  width: 50,
                  height: 50,
                  image: AssetImage("assets/images/Placeholder_profilePic.png"),
                ),
              ),
              Text(
                name ?? "username",
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xffAB6832),
                  height: 1,
                ),
              )
            ],
          ),
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.brown)),
            margin: new EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 100,
                      child: Image(
                        width: 150,
                        height: 150,
                        image:
                            AssetImage("assets/images/coffeePlaceholder.png"),
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          coffeeRating.coffeeName ?? "Coffee Name",
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xffAB6832),
                            height: 1,
                          ),
                        ),
                        Text(
                          "Coffee Name",
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xffAB6832),
                            height: 1,
                          ),
                        ),
                        Text(
                          coffeeRating.serveringStyle.toString() ??
                              "Serving style",
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xffAB6832),
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  margin: new EdgeInsets.only(left: 60.0, top: 20, bottom: 20),
                  child: Row(
                    children: [
                      RatingBar.builder(
                        initialRating: coffeeRating.rating ?? 0,
                        minRating: 0,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        ignoreGestures: true,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {},
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: new EdgeInsets.only(left: 40.0, bottom: 20),
                  child: Row(children: [
                    Text(
                      coffeeRating.comment ?? "Comment",
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xffAB6832),
                        height: 1,
                      ),
                    ),
                  ]),
                ),
                Container(
                  margin: new EdgeInsets.only(left: 60.0, bottom: 20),
                  child: Row(children: [
                    Text(
                      coffeeRating.location ?? "location",
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xffAB6832),
                        height: 1,
                      ),
                    ),
                  ]),
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
