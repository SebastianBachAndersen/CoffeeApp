import 'package:flutter/material.dart';
import 'package:the_coffe_collection/repositories/coffee_repository.dart';

import 'landing_page.dart';

class AddFriendsView extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<AddFriendsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff49281A),
        title: const Text('AddFriendsView'),
      ),
    );
  }
}
