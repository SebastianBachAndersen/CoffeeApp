import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_coffe_collection/Models/coffee.dart';
import 'package:the_coffe_collection/Pages/rate_coffee_view.dart';
import 'package:the_coffe_collection/bloc/coffee/coffee_bloc.dart';

class CoffeeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: BlocBuilder<CoffeeBloc, CoffeeState>(builder: (context, state) {
      if (state is CoffeeListLoaded) {
        return ListView(
          children: state.coffees
              .map<Widget>((coffee) => coffeeSearchCard(coffee, context))
              .toList(),
        );
      } else if (state is CoffeeLoading) {
        return Container(
          decoration: BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.5)),
          child: Center(child: CircularProgressIndicator()),
        );
      } else {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                size: 48,
              ),
              Text(
                'Ukendt fejl opstod',
                style: Theme.of(context).textTheme.headline6,
              ),
            ],
          ),
        );
      }
    }));
  }
}

Widget coffeeSearchCard(Coffee coffee, BuildContext context) {
  return Card(
    child: InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => RateCoffeeView()));
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Image(
              image: AssetImage("assets/images/coffeePlaceholder.png"),
              fit: BoxFit.cover,
            ),
            title: Text(coffee.name ?? "Coffee name"), //der skal noget ind her!
            subtitle: Text("Company name"),
            trailing: Text("5"),
          ),
        ],
      ),
    ),
  );
}
