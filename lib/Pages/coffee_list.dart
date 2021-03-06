import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_coffe_collection/Models/coffee.dart';
import 'package:the_coffe_collection/Pages/rate_coffee_route.dart';
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
            context,
            MaterialPageRoute(
                builder: (context) => RateCoffeeRoute(coffee: coffee)));
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: CachedNetworkImage(
              imageUrl: coffee.imageLink,
              width: 60,
              fit: BoxFit.contain,
              placeholder: (context, url) => Image(
                image: AssetImage("assets/images/coffeePlaceholder.png"),
                width: 60,
              ),
              errorWidget: (context, url, error) => Image(
                width: 60,
                image: AssetImage("assets/images/coffeePlaceholder.png"),
              ),
            ),
            title: Text(coffee.name ?? "Coffee name"), //der skal noget ind her!
            subtitle: Text(coffee.coffeeCompanyName ?? "Company name"),
            trailing: Text(
              double.parse((coffee.averageRating).toStringAsFixed(2))
                      .toString() ??
                  "Rating",
            ),
          ),
        ],
      ),
    ),
  );
}
