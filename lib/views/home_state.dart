part of 'home_bloc.dart';

@immutable
abstract class HomeState {}
class HomeActionState extends HomeState{}
class SecondPageInitialState extends HomeState{
  int? data;
  SecondPageInitialState({this.data});
}
class HomeInitial extends HomeState {}
class HomeLoadingState extends HomeState{}
class InitialState extends HomeState{
int? data;
InitialState({this.data});
}
class NavigateToSecondPageActionState extends HomeActionState{}

