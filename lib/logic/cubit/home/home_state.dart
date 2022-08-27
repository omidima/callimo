part of 'home_cubit.dart';

abstract class HomeState {}

class InitState extends HomeState{}
class CallCreatedState extends HomeState {
  MessageDto messageDto;
  CallCreatedState(this.messageDto);
}

class CreateCallLoadingState extends HomeState {}

class CallErrorState extends HomeState {
  String? message;
  CallErrorState({this.message});
}
