import 'package:bloc/bloc.dart';
import 'package:untitled2/net/get_picture.dart';

part 'calcur_event.dart';
part 'calcur_state.dart';

class CalcurBloc extends Bloc<CalcurEvent, String> {
  CalcurBloc() : super("190") {
    on<CalculIncrementEvent> (_onInc);
  }

  _onInc(CalculIncrementEvent event, Emitter<String> emit) async {
    final townResponse = await getHttp(event.town);

    emit(townResponse.toString());
  }
}
