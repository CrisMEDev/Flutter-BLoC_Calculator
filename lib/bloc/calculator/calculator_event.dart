part of 'calculator_bloc.dart';


// Aqui se definen todos los eventos que extiendan de CalculatorEvent

@immutable
abstract class CalculatorEvent {}


class ResetAC extends CalculatorEvent{}

class AddNumber extends CalculatorEvent{
  final String number;

  AddNumber(this.number);
}
