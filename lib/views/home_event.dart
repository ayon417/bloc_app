part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}
class HomeInitialEvent extends HomeEvent{}



class CounterEvent extends HomeEvent{}
class NavigateToSecondPageEvent extends HomeEvent{}
class DecreaseEvent extends HomeEvent{}
class NavigateBackEvent extends HomeEvent{}