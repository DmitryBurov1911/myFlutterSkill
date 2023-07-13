import 'package:bloc/bloc.dart';

part 'calcur_event.dart';
part 'calcur_state.dart';

class CalcurBloc extends Bloc<CalcurEvent, int> {
  CalcurBloc() : super(5) {
    on<CalculIncrementEvent> (_onInc);
    on<CalculDecrementEvent> (_onDec);
  }

  _onInc(CalculIncrementEvent event, Emitter<int> emit) async {
    emit(state + 1);
  }

  _onDec(CalculDecrementEvent event, Emitter<int> emit) {
    emit(state - 1);
  }
}
