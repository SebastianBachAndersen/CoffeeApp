import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_coffe_collection/Pages/authenticated_page.dart';
import 'package:the_coffe_collection/Pages/login.dart';
import 'package:the_coffe_collection/bloc/authentication/authentication_bloc.dart';
import 'package:the_coffe_collection/components/custom_colors.dart';
import 'package:the_coffe_collection/repositories/user_repository.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'Pages/landing_page.dart';
import 'app_config.dart';
import 'bloc/authentication/authentication_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //startDevelopment();
  runApp(MyApp());
}

void startDevelopment() {
  AppConfig.getInstance(
    baseUrl: 'http://10.0.2.2:5001',
    apiUrl: 'http://10.0.2.2:5001/api/',
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AuthenticatedPage();
  }
}

class MyApps extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<UserRepository>(
          create: (context) => UserRepository(),
        ),
      ],
      child: BlocProvider(
        create: (context) {
          AuthenticationBloc authBloc = AuthenticationBloc(
              userRepository: RepositoryProvider.of<UserRepository>(context));

          authBloc.add(AppStarted());

          return authBloc;
        },
        child: MaterialApp(
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [
              const Locale('da')
            ],
            title: 'The Coffee Collection',
            theme: ThemeData(
              primarySwatch: CustomColors.primaryColor,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: LandingPage()),
      ),
    );
  }
}
