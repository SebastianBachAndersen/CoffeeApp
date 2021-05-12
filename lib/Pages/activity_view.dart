import 'package:flutter/material.dart';

import 'landing_page.dart';

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
