abstract class LoginState {}

class InitLoginState extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginFailer extends LoginState {
  String? error;
  LoginFailer({this.error});
}

class NumberInvalide extends LoginState {}

class NumberValide extends LoginState {}
