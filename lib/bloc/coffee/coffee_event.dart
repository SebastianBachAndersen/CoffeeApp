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
  final String genreName;
  final String coffeeCompanyId;

  const CreateCofee(
      {@required this.name,
      @required this.date,
      @required this.genreName,
      @required this.coffeeCompanyId});

  @override
  List<Object> get props => [
        this.name,
        this.date,
        this.genreName,
        this.coffeeCompanyId,
      ];
}

class CreateCoffeeRating extends CoffeeEvent {
  final int rating;
  final DateTime date;
  final String comment;
  final String location;
  final String coffeeId;
  final ServingStyle servingStyle;

  const CreateCoffeeRating(
      {this.rating,
      this.date,
      this.comment,
      this.location,
      @required this.coffeeId,
      this.servingStyle});
  @override
  List<Object> get props => [
        this.rating,
        this.date,
        this.comment,
        this.location,
        this.coffeeId,
        this.servingStyle
      ];
}
