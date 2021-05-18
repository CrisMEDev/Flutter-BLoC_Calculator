part of 'calculator_bloc.dart';

// @immutable
/*abstract*/ class CalculatorState {
  final String mathResult;
  final String firstNumber;
  final String secondNumber;
  final String operation;

  CalculatorState({
    this.mathResult = '0',
    this.firstNumber = '0',
    this.secondNumber = '0',
    this.operation = '0'
  });

}

// class CalculatorInitial extends CalculatorState {}
