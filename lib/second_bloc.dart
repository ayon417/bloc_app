import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_state_app/views/home_bloc.dart';
import 'package:meta/meta.dart';

import 'controller.dart';

part 'second_event.dart';
part 'second_state.dart';

class SecondBloc extends Bloc<SecondEvent, SecondState> {
  //Controller controller=Controller();
  SecondBloc() : super(SecondInitial()) {
    on<SecondInitialEvent>(secondInitialEvent);
    on<SecondDecreaseEvent>(decreaseEvent);
    on<NavigateToBackEvent>(navigateToBackEvent);
  }

  FutureOr<void> secondInitialEvent(SecondInitialEvent event, Emitter<SecondState> emit) {
    emit(SecondInitialState(data:controller.x ));
  }

  FutureOr<void> decreaseEvent(SecondDecreaseEvent event, Emitter<SecondState> emit) {
    controller.decrease();
    emit(SecondInitialState(data: controller.x));
    print('decreasing');
}

  FutureOr<void> navigateToBackEvent(NavigateToBackEvent event, Emitter<SecondState> emit) {
    emit(NavigateBackActionState());
  }
}
