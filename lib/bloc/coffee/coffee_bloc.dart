import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_coffe_collection/Models/coffee.dart';
import 'package:the_coffe_collection/Models/coffee_rating.dart';
import 'package:the_coffe_collection/Models/user.dart';
import 'package:the_coffe_collection/enums/generic_api_error_reason.dart';
import 'package:the_coffe_collection/enums/serving_style.dart';
import 'package:the_coffe_collection/repositories/coffee_repository.dart';

part 'coffee_state.dart';
part 'coffee_event.dart';

class CoffeeBloc extends Bloc<CoffeeEvent, CoffeeState> {
  final CoffeeRepository coffeeRepository;

  CoffeeBloc({@required this.coffeeRepository}) : super(CoffeeInitial());

  @override
  Stream<CoffeeState> mapEventToState(CoffeeEvent event) async* {
    if (event is FetchCoffees) {
      yield CoffeeLoading();

      try {
        List<Coffee> coffees = await coffeeRepository.getCoffees();
        yield CoffeeListLoaded(coffees: coffees);
      } on DioError catch (error) {
        if (error.type != DioErrorType.response) {
          yield CoffeeError(reason: GenericApiErrorReason.noConnection);
        }

        if (error.response.statusCode == 401) {
          yield CoffeeError(reason: GenericApiErrorReason.unauthorized);
        }
      }
    }
    if (event is CreateCofee) {
      yield CoffeeCreating();

      try {
        Coffee createdCoffee = await coffeeRepository.createCoffee(
            event.name, event.date, event.genreName, event.coffeeCompanyId);

        yield CoffeeCreated(coffee: createdCoffee);
      } on DioError catch (error) {
        if (error.type != DioErrorType.response) {
          yield CoffeeError(reason: GenericApiErrorReason.noConnection);
        }

        if (error.response.statusCode == 401) {
          yield CoffeeError(reason: GenericApiErrorReason.unauthorized);
        }
      }
    }
    if (event is CreateCoffeeRating) {
      yield CoffeeRatingCreating();

      try {
        CoffeeRating coffeeRating = await coffeeRepository.rateCoffee(
            event.rating,
            event.date,
            event.comment,
            event.location,
            event.coffeeId,
            event.servingStyle);
        yield CoffeeRatingCreated(coffeeRating: coffeeRating);
      } on DioError catch (error) {
        if (error.type != DioErrorType.response) {
          yield CoffeeError(reason: GenericApiErrorReason.noConnection);
        }

        if (error.response.statusCode == 401) {
          yield CoffeeError(reason: GenericApiErrorReason.unauthorized);
        }
      }
    }
    if (event is FetchUserRatings) {
      yield UserCoffeeRatingsLoading();

      try {
        User userRatings = await coffeeRepository.getUserRatings();
        yield UserCoffeeRatingsLoaded(user: userRatings);
      } on DioError catch (error) {
        if (error.type != DioErrorType.response) {
          yield CoffeeError(reason: GenericApiErrorReason.noConnection);
        }

        if (error.response.statusCode == 401) {
          yield CoffeeError(reason: GenericApiErrorReason.unauthorized);
        }
      }
    }
  }
}
