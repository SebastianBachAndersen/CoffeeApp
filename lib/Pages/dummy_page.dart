import 'package:flutter/material.dart';

class DummyPage extends StatefulWidget {
  @override
  _DummyPageState createState() => _DummyPageState();
}

class _DummyPageState extends State<DummyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[Text("nuts")],
    ));
  }
}
