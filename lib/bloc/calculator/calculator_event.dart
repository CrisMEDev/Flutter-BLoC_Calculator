part of 'calculator_bloc.dart';


// Aqui se definen todos los eventos que extiendan de CalculatorEvent

@immutable
abstract class CalculatorEvent {}


class ResetAC extends CalculatorEvent{}

class AddNumber extends CalculatorEvent{
  final String number;

  AddNumber(this.number);
}

class ChangeNumberSign extends CalculatorEvent{}

class DeleteLastEntry extends CalculatorEvent{}

class OperationEntry extends CalculatorEvent{
  final String operation;

  OperationEntry(this.operation);
}

class CalculateResult extends CalculatorEvent{}

