import 'package:flutter/material.dart';

import 'landing_page.dart';

class SearchView extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff49281A),
          title: const Text('Search'),
        ),
      ),
    );
  }
}
