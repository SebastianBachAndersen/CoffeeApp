import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_coffe_collection/Models/coffee.dart';
import 'package:the_coffe_collection/Pages/rate_coffee_route.dart';
import 'package:the_coffe_collection/bloc/coffee/coffee_bloc.dart';
import 'package:the_coffe_collection/main.dart';
import 'package:the_coffe_collection/repositories/coffee_repository.dart';

class SearchView extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Color(0xff49281A),
          title: const Text('Search'),
        ),
        body: Container(child: ListSearch()),
      ),
    );
  }
}

class ListSearch extends StatefulWidget {
  ListSearchState createState() => ListSearchState();
}

class ListSearchState extends State<ListSearch> {
  TextEditingController _textController = TextEditingController();

  List<Coffee> mainDataList = [];

  // Copy Main List into New List.
  List<Coffee> newDataList = [];

  onItemChanged(String value) {
    if (value == "") {
      newDataList = [];
      newDataList = mainDataList;
    }
    setState(() {
      newDataList = [];
      newDataList = mainDataList
          .where((string) =>
              string.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CoffeeBloc(
          coffeeRepository: RepositoryProvider.of<CoffeeRepository>(context))
        ..add(FetchCoffees()),
      child: BlocBuilder<CoffeeBloc, CoffeeState>(
        builder: (context, state) {
          if (state is CoffeeListLoaded) {
            mainDataList = state.coffees;
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                      hintText: 'Search for coffee',
                    ),
                    onChanged: onItemChanged,
                  ),
                ),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.all(12.0),
                    children: newDataList
                        .map((coffee) => coffeeNames(coffee, context))
                        .toList(),
                  ),
                ),
              ],
            );
          } else {
            return Container(
              decoration: BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.5)),
              child: Center(child: CircularProgressIndicator()),
            );
          }
        },
      ),
    );
  }
}

Widget coffeeNames(
  Coffee coffee,
  BuildContext context,
) {
  return ListTile(
    title: Text(coffee.name),
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => RateCoffeeRoute(coffee: coffee)));
    },
  );
}
