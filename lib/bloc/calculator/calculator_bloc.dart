import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(CalculatorState());

  @override
  Stream<CalculatorState> mapEventToState(  // Cuando se llame este metodo el Bloc sabe que ese algo sera de tipo calculator state
    CalculatorEvent event,
  ) async* {  // Lo que indica un async* es que se estara trabajando con un stream en lugar de un future
    if ( event is ResetAC ){
      yield CalculatorState( // El yield es para retornar un nuevo state en un stream
        firstNumber: '0',
        mathResult: '0',
        operation: '',
        secondNumber: '0'
      );
    } else if ( event is AddNumber ){
      yield CalculatorState(
        firstNumber: '0',
        operation: '',
        secondNumber: '0',
        mathResult: (state.mathResult == '0')
                    ? event.number
                    : state.mathResult + event.number,
      );
    }
  }
}
