import 'package:flutter/material.dart';
import 'package:the_coffe_collection/Pages/friends_view.dart';
import 'package:the_coffe_collection/Pages/settings.dart';
import 'package:the_coffe_collection/components/User_placeholder.dart';

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
            ],
          ),
          body: User_placeholder()),
    );
  }
}
