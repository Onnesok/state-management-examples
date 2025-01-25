// CUBIT is a simplified version of Bloc for easy state management

import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  //Constructor : get initial state
  CounterCubit(super.initialState);

  //increment counter
  void increment() => emit(state + 1);

  //decrement counter
  void decrement() => emit(state - 1);

}


