import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../controller.dart';

part 'home_event.dart';
part 'home_state.dart';
Controller controller=Controller();
class HomeBloc extends Bloc<HomeEvent, HomeState> {

  HomeBloc() : super(HomeInitial()) {

   on<HomeInitialEvent>(homeInitialEvent);
   on<CounterEvent>(counterEvent);
   on<NavigateToSecondPageEvent>(navigateToSecondPageEvent);
   //on<DecreaseEvent>(decreaseEvent);

  }

  FutureOr<void> homeInitialEvent(HomeInitialEvent event, Emitter<HomeState> emit)async {
    // emit(HomeLoadingState());
    // await Future.delayed(const Duration(seconds: 2));

    emit(InitialState(data:controller.x));
    print("your home page");
  }


  FutureOr<void> counterEvent(CounterEvent event, Emitter<HomeState> emit) {

    controller.increase();
      emit(InitialState(data:controller.x));
  }

  FutureOr<void> navigateToSecondPageEvent(NavigateToSecondPageEvent event, Emitter<HomeState> emit) {
    print('navigate to second page');
    emit(NavigateToSecondPageActionState());
  }


  //
  // FutureOr<void> decreaseEvent(DecreaseEvent event, Emitter<HomeState> emit) {
  //   controller.decrease();
  //   emit(SecondPageInitialState(data: controller.x));
  //   print('decreasing');
  // }

}
