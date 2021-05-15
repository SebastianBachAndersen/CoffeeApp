import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_coffe_collection/Pages/coffee_list.dart';
import 'package:the_coffe_collection/bloc/coffee/coffee_bloc.dart';
import 'package:the_coffe_collection/repositories/coffee_repository.dart';
import 'package:the_coffe_collection/utils/shared_preferences.dart';

import 'landing_page.dart';

SharedPreference prefer = new SharedPreference();

class ActivityView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CoffeeBloc(
        coffeeRepository: RepositoryProvider.of<CoffeeRepository>(context),
      )..add(FetchCoffees()),
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [Flexible(child: CoffeeList())],
        ),
      ),
    );
  }
}
