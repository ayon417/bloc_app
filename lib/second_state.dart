part of 'second_bloc.dart';

@immutable
abstract class SecondState {}
class SecondActionState extends SecondState{}
class SecondInitial extends SecondState {}
class SecondInitialState extends SecondState{
  int? data;
  SecondInitialState({this.data});
}
class NavigateBackActionState extends SecondActionState{}
