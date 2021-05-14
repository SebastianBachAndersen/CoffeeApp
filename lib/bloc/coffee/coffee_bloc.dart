import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_coffe_collection/Models/coffee.dart';
import 'package:the_coffe_collection/enums/generic_api_error_reason.dart';
import 'package:the_coffe_collection/enums/genre_enum.dart';
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
            event.name, event.date, event.genre, event.coffeeCompanyId);

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
  }
}
