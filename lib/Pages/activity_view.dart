import 'package:flutter/material.dart';
import 'package:the_coffe_collection/utils/shared_preferences.dart';

import 'landing_page.dart';

SharedPreference prefer = new SharedPreference();

class ActivityView extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<ActivityView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff49281A),
          title: const Text('Main activity'),
        ),
      ),
    );
  }
}
