import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_coffe_collection/bloc/login/login_bloc.dart';
import 'package:the_coffe_collection/components/custom_colors.dart';
import 'package:the_coffe_collection/components/raised_button.dart';
import 'package:the_coffe_collection/components/text_field.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool rememberMe = true;

  Widget _usernamePasswordWidget() {
    return Column(
      children: <Widget>[
        StyledTextField('E-mail adresse', _emailController, submitHandler: (_) {
          FocusScope.of(context).nextFocus();
        }),
        Focus(
            child: StyledTextField('Kodeord', _passwordController,
                isPassword: true, submitHandler: (_) {
          BlocProvider.of<LoginBloc>(context).add(
            LoginUser(
                identifier: _emailController.text,
                password: _passwordController.text),
          );
        })),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginError) {
          final snackBar = SnackBar(
            content: Text('Invalid login credentials'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/coffee.jpeg"), fit: BoxFit.cover)),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: Text(
                "The Coffee collection",
                style: TextStyle(color: CustomColors.secondaryColor),
              ),
            ),
            body: Container(
              child: Stack(
                children: <Widget>[
                  Container(
                      height: height,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: SingleChildScrollView(
                          child: ConstrainedBox(
                              constraints: BoxConstraints(maxHeight: height),
                              child: SafeArea(
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                    _usernamePasswordWidget(),
                                    BlocBuilder<LoginBloc, LoginState>(
                                      builder: (context, state) {
                                        return StyledRaisedButton(context,
                                            text: 'Log ind',
                                            loading: state is LoginLoading,
                                            padding: 16, callback: () {
                                          BlocProvider.of<LoginBloc>(context)
                                              .add(
                                            LoginUser(
                                                identifier:
                                                    _emailController.text,
                                                password:
                                                    _passwordController.text),
                                          );
                                        });
                                      },
                                    ),
                                  ])))))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
