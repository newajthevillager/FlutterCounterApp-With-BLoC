import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:counter_app_bloc/counter_ event.dart';

class CounterBloc extends Bloc<CounterEvent, int> {

  @override
  // TODO: implement initialState
  int get initialState => 0;

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    // TODO: implement mapEventToState
    if (event is IncrementEvent) {
      yield currentState + 1;
    } else {
      yield currentState - 1;
    }
  }

}