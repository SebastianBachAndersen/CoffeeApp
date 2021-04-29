import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "The Coffee Collection",
      home: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/coffee.jpeg"), fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.brown,
            title: Text("The Coffee collection"),
          ),
        ),
      ),
    );
  }
}
