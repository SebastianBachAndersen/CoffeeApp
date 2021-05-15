import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_coffe_collection/Pages/friends_view.dart';
import 'package:the_coffe_collection/Pages/settings.dart';
import 'package:the_coffe_collection/bloc/authentication/authentication_bloc.dart';
import 'package:the_coffe_collection/components/User_placeholder.dart';
import 'package:the_coffe_collection/utils/shared_preferences.dart';

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
                        builder: (BuildContext context) =>
                            logoutDialog(context));
                  }),
            ],
          ),
          body: User_placeholder()),
    );
  }
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
