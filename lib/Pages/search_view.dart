import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_coffe_collection/bloc/coffee/coffee_bloc.dart';
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
        appBar: AppBar(
          backgroundColor: Color(0xff49281A),
          title: const Text('Search'),
        ),
        body: Center(child: ListSearch()),
      ),
    );
  }
}

class ListSearch extends StatefulWidget {
  ListSearchState createState() => ListSearchState();
}

class ListSearchState extends State<ListSearch> {
  TextEditingController _textController = TextEditingController();

  static List<String> mainDataList = [];

  // Copy Main List into New List.
  List<String> newDataList = List.from(mainDataList);

  onItemChanged(String value) {
    if (value == "") {}
    setState(() {
      newDataList = mainDataList
          .where((string) => string.toLowerCase().contains(value.toLowerCase()))
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
            mainDataList
                .addAll(state.coffees.map((coffee) => coffee.name).toList());
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                      hintText: 'Search Here...',
                    ),
                    onChanged: onItemChanged,
                  ),
                ),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.all(12.0),
                    children:
                        newDataList.map((name) => coffeeNames(name)).toList(),
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

Widget coffeeNames(String name) {
  return ListTile(title: Text(name));
}
