part of 'calcur_bloc.dart';

abstract class CalcurEvent {}

class CalculIncrementEvent extends CalcurEvent {
  String town;

  CalculIncrementEvent(this.town);
}
