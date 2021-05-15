part of 'coffee_bloc.dart';

abstract class CoffeeState extends Equatable {
  const CoffeeState();

  @override
  List<Object> get props => [];
}

class CoffeeInitial extends CoffeeState {}

class CoffeeLoading extends CoffeeState {}

class CoffeeListLoaded extends CoffeeState {
  final List<Coffee> coffees;

  CoffeeListLoaded({this.coffees});
}

class CoffeeLoaded extends CoffeeState {
  final Coffee coffee;

  CoffeeLoaded({
    @required this.coffee,
  });
}

class CoffeeCreating extends CoffeeState {}

class CoffeeCreated extends CoffeeLoaded {
  CoffeeCreated({@required Coffee coffee}) : super(coffee: coffee);
}

class CoffeeError extends CoffeeState {
  final GenericApiErrorReason reason;

  CoffeeError({@required this.reason});
}

class CoffeeRatingCreating extends CoffeeState {}

class CoffeeRatingLoaded extends CoffeeState {
  final CoffeeRating coffeeRating;

  CoffeeRatingLoaded({
    @required this.coffeeRating,
  });
}

class CoffeeRatingCreated extends CoffeeRatingLoaded {
  CoffeeRatingCreated({@required CoffeeRating coffeeRating})
      : super(coffeeRating: coffeeRating);
}
