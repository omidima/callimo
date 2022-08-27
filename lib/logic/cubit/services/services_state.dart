part of 'services_cubit.dart';

abstract class ServicesState {}

class ServicesInitState extends ServicesState {}

class LoadUserDataState extends ServicesState {
  UserDto user;
  LoadUserDataState(
    this.user,
  );
}
