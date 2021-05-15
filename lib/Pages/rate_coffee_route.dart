import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_coffe_collection/Models/coffee.dart';
import 'package:the_coffe_collection/Pages/rate_coffee_view.dart';
import 'package:the_coffe_collection/bloc/coffee/coffee_bloc.dart';
import 'package:the_coffe_collection/repositories/coffee_repository.dart';

class RateCoffeeRoute extends StatelessWidget {
  final Coffee coffee;
  RateCoffeeRoute({Key key, @required this.coffee}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return CoffeeBloc(
            coffeeRepository: RepositoryProvider.of<CoffeeRepository>(context));
      },
      child: RateCoffeeView(
        coffee: coffee,
        key: key,
      ),
    );
  }
}
