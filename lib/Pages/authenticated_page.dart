import 'package:flutter/material.dart';
import 'package:the_coffe_collection/Pages/activity_view.dart';
import 'package:the_coffe_collection/Pages/profile_view.dart';
import 'package:the_coffe_collection/Pages/search_view.dart';
import 'package:the_coffe_collection/utils/shared_preferences.dart';

import 'landing_page.dart';

class AuthenticatedPage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<AuthenticatedPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.menu_sharp),
              label: 'Activity',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Søg',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'min profil',
            ),
          ],
          currentIndex: _selectedIndex,
          unselectedItemColor: Color(0xffAB6832),
          selectedItemColor: Color(0xffDFB78C),
          backgroundColor: Color(0xff49281A),
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    ActivityView(),
    SearchView(),
    ProfileView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
