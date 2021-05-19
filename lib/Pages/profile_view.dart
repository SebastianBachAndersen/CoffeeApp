import 'package:cached_network_image/cached_network_image.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_coffe_collection/Models/coffee_rating.dart';
import 'package:the_coffe_collection/Pages/friends_view.dart';
import 'package:the_coffe_collection/Pages/settings.dart';
import 'package:the_coffe_collection/bloc/authentication/authentication_bloc.dart';
import 'package:the_coffe_collection/bloc/coffee/coffee_bloc.dart';
import 'package:the_coffe_collection/components/User_placeholder.dart';
import 'package:the_coffe_collection/repositories/coffee_repository.dart';

import '../components/User_placeholder.dart';
import 'landing_page.dart';

class ProfileView extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff49281A),
          title: const Text('Mine profile'),
          actions: [
            IconButton(
                icon: const Icon(Icons.people),
                tooltip: 'Show Snackbar',
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FriendsView()));
                }),
            IconButton(
                icon: const Icon(Icons.settings),
                tooltip: 'Show Snackbar',
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Settings()));
                }),
            IconButton(
                icon: const Icon(Icons.logout),
                tooltip: 'Show Snackbar',
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => logoutDialog(context));
                }),
          ],
        ),
        body: BlocProvider(
          create: (BuildContext context) => CoffeeBloc(
              coffeeRepository:
                  RepositoryProvider.of<CoffeeRepository>(context))
            ..add(FetchUserRatings()),
          child: BlocBuilder<CoffeeBloc, CoffeeState>(
            builder: (context, state) {
              if (state is UserCoffeeRatingsLoaded) {
                return Container(
                  child: ListView(
                    children: [
                      Container(
                          height: 210,
                          child: User_placeholder(user: state.user)),
                      ...state.user.coffeeRatings
                          .map<Widget>((coffeeRating) => ratingCard(
                                coffeeRating,
                                state.user.firstName,
                              ))
                          .toList()
                    ],
                  ),
                );
              } else if (state is UserCoffeeRatingsLoading) {
                return Container(
                  decoration:
                      BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.5)),
                  child: Center(child: CircularProgressIndicator()),
                );
              } else {
                return Container(
                  decoration:
                      BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.5)),
                  child: Center(child: CircularProgressIndicator()),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

Widget ratingCard(CoffeeRating coffeeRating, String name) {
  return Container(
    color: Colors.brown,
    child: Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
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
                      child: CachedNetworkImage(
                        imageUrl: coffeeRating.imageLink,
                        width: 100,
                        height: 150,
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: new EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            coffeeRating.coffeeName ?? "Coffee Name",
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xffAB6832),
                              height: 1,
                            ),
                          ),
                        ),
                        Container(
                          margin: new EdgeInsets.only(bottom: 10),
                          child: Text(
                            coffeeRating.coffeeCompanyName ?? "Coffee Name",
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xffAB6832),
                              height: 1,
                            ),
                          ),
                        ),
                        Text(
                          EnumToString.convertToString(
                                  coffeeRating.serveringStyle,
                                  camelCase: true) ??
                              "Coffee Name",
                          style: TextStyle(
                            fontSize: 16,
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
                        initialRating: coffeeRating.rating,
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
                      "Commnent",
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
                      coffeeRating.comment ?? "Comment",
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

Widget logoutDialog(BuildContext context) {
  return new AlertDialog(
    title: const Text("Are you sure you want to logout?"),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
    ),
    actions: [
      TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text("No", style: const TextStyle(fontSize: 20)),
      ),
      TextButton(
        onPressed: () async {
          await clearPref();
          BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
          Navigator.pop(context);
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LandingPage()));
        },
        child: Text("Yes", style: const TextStyle(fontSize: 20)),
      )
    ],
  );
}

Future<void> clearPref() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  pref.clear();
}
