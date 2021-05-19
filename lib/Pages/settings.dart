import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff49281A),
        title: const Text('Settings'),
      ),
    );
  }
}
