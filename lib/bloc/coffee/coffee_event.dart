part of 'coffee_bloc.dart';

abstract class CoffeeEvent extends Equatable {
  const CoffeeEvent();

  @override
  List<Object> get props => [];
}

class FetchCoffees extends CoffeeEvent {}

class CreateCofee extends CoffeeEvent {
  final String name;
  final DateTime date;
  final Genre genre;
  final String coffeeCompanyId;

  const CreateCofee(
      {@required this.name,
      @required this.date,
      @required this.genre,
      @required this.coffeeCompanyId});

  @override
  List<Object> get props => [
        this.name,
        this.date,
        this.genre,
        this.coffeeCompanyId,
      ];
}
