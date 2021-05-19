import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:the_coffe_collection/Models/coffee.dart';
import 'package:the_coffe_collection/bloc/coffee/coffee_bloc.dart';
import 'package:the_coffe_collection/components/raised_button.dart';
import 'package:the_coffe_collection/enums/serving_style.dart';

class RateCoffeeView extends StatefulWidget {
  final Coffee coffee;
  RateCoffeeView({Key key, @required this.coffee}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<RateCoffeeView> {
  String _text = "Current Rating: ";
  final _comment = TextEditingController();
  double _rating = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff49281A),
        title: const Text('RateCoffeeView'),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: new EdgeInsets.symmetric(horizontal: 20.0),
                  width: 100,
                  child: new Container(
                    child: CachedNetworkImage(
                      imageUrl: widget.coffee.imageLink,
                      placeholder: (context, url) => Image(
                        image:
                            AssetImage("assets/images/coffeePlaceholder.png"),
                      ),
                      errorWidget: (context, url, error) => Image(
                        image:
                            AssetImage("assets/images/coffeePlaceholder.png"),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: new EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        widget.coffee.name ?? "default",
                        softWrap: true,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffAB6832),
                        ),
                      ),
                      Text(
                        widget.coffee.coffeeCompanyName ?? "default",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xffAB6832),
                          height: 3,
                        ),
                      ),
                      Text(
                        widget.coffee.genreName ?? "default",
                        style:
                            TextStyle(fontSize: 16, color: Color(0xffAB6832)),
                      )
                    ],
                  ),
                )
              ],
            ),
            Divider(color: Colors.black),
            Row(
              children: [
                Container(
                  margin: new EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    "Rating",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xffAB6832),
                      height: 1,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RatingBar.builder(
                  initialRating: 0,
                  minRating: 0,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  updateOnDrag: true,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    setState(() {
                      _text = "Current Rating: " + rating.toString();
                      _rating = rating.toDouble();
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text(_text),
                ),
              ],
            ),
            Divider(color: Colors.black),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: new EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    "Serving style",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xffAB6832),
                      height: 1,
                    ),
                  ),
                )
              ],
            ),
            Container(
              margin: new EdgeInsets.symmetric(horizontal: 20.0),
              child: chips(),
            ),
            Divider(color: Colors.black),
            Container(
              margin: new EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Kommentar",
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xffAB6832),
                  height: 1,
                ),
              ),
            ),
            Container(
              margin: new EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: _comment,
              ),
            ),
            Divider(color: Colors.black),
            BlocBuilder<CoffeeBloc, CoffeeState>(
              builder: (context, state) {
                return StyledRaisedButton(context,
                    color: Color(0xff49281A),
                    text: 'Send Ratring',
                    loading: state is CoffeeRatingCreating,
                    padding: 16, callback: () {
                  BlocProvider.of<CoffeeBloc>(context).add(
                    CreateCoffeeRating(
                      coffeeId: widget.coffee.id,
                      comment: _comment.text ?? "",
                      date: DateTime.now(),
                      location: "",
                      rating: _rating,
                      servingStyle: coffeeSeveringType(),
                    ),
                  );
                  Navigator.pop(context);
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  coffeeSeveringType() {
    if (_selected1 == true) {
      return ServingStyle.americano;
    } else if (_selected2 == true) {
      return ServingStyle.espresso;
    } else if (_selected3 == true) {
      return ServingStyle.latte;
    } else if (_selected4 == true) {
      return ServingStyle.coldbrew;
    } else {
      return ServingStyle.americano;
    }
  }

  bool _selected1 = true;
  bool _selected2 = false;
  bool _selected3 = false;
  bool _selected4 = false;
  Widget chips() {
    return Row(
      children: [
        ChoiceChip(
          selected: _selected1,
          label: Text('Amrikano'),
          onSelected: (bool selected) {
            setState(() {
              _selected1 = !_selected1;
              _selected2 = false;
              _selected3 = false;
              _selected4 = false;
            });
          },
        ),
        ChoiceChip(
          selected: _selected2,
          label: Text('Esprasso'),
          onSelected: (bool selected) {
            setState(() {
              _selected2 = !_selected2;
              _selected1 = false;
              _selected3 = false;
              _selected4 = false;
            });
          },
        ),
        ChoiceChip(
          selected: _selected3,
          label: Text('Latte'),
          onSelected: (bool selected) {
            setState(() {
              _selected3 = !_selected3;
              _selected2 = false;
              _selected1 = false;
              _selected4 = false;
            });
          },
        ),
        ChoiceChip(
          selected: _selected4,
          label: Text('ColdBrew'),
          onSelected: (bool selected) {
            setState(() {
              _selected4 = !_selected4;
              _selected2 = false;
              _selected3 = false;
              _selected1 = false;
            });
          },
        )
      ],
    );
  }
}
