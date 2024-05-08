part of 'second_bloc.dart';

@immutable
abstract class SecondEvent {}
class SecondInitialEvent extends SecondEvent{}
class SecondDecreaseEvent extends SecondEvent{}
class NavigateToBackEvent extends SecondEvent{}
