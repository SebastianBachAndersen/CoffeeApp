import 'package:flutter/material.dart';
import 'package:the_coffe_collection/Pages/add_friends_view.dart';

class FriendsView extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<FriendsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff49281A),
        title: const Text('friends'),
        actions: [
          IconButton(
              icon: const Icon(Icons.person_add),
              tooltip: 'Show Snackbar',
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddFriendsView()));
              }),
        ],
      ),
    );
  }
}
