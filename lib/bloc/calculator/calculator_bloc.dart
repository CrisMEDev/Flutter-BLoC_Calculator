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
      yield* this._resetAC();           // yield* significa: no quiero que emitas el stream, quiero que emitas el valor que ese stream va a emitir
    } else if ( event is AddNumber ){
      yield state.copyWith(
        mathResult: (state.mathResult == '0')
                    ? event.number
                    : state.mathResult + event.number,
      );
    } else if ( event is ChangeNumberSign ){
      yield state.copyWith(
        mathResult: state.mathResult.contains('-')
                    ? state.mathResult.replaceFirst('-', '')
                    : '-' + state.mathResult,
      );
    } else if ( event is DeleteLastEntry ){
      yield state.copyWith(
        mathResult: (state.mathResult.length > 1)
                    ? state.mathResult.substring(0, state.mathResult.length - 1)
                    : '0',
      );
    } else if ( event is OperationEntry ){
      yield state.copyWith(
        firstNumber: state.mathResult,
        mathResult: '0',
        operation: event.operation,
        secondNumber: '0'
      );
    } else if ( event is CalculateResult ){
      yield* _calculateResult();
    }
  }

  Stream<CalculatorState> _resetAC() async* {
    yield CalculatorState( // El yield es para retornar un nuevo state en un stream
      firstNumber: '0',
      mathResult: '0',
      operation: '+',
      secondNumber: '0'
    );
  }

  Stream<CalculatorState> _calculateResult() async* {

    final double num1 = double.parse( state.firstNumber );
    final double num2 = double.parse( state.mathResult );

    switch( state.operation ){
      case '+':
        yield state.copyWith(
          secondNumber: state.mathResult,
          mathResult: '${ num1 + num2 }',
        );
      break;
      case '-':

      break;
      case '*':

      break;
      case '/':

      break;

      default:
        yield state;
    }

  }
}
