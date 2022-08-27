part of 'signup_bloc.dart';

abstract class SignupState {}

class StartSignup extends SignupState {}

class ChangeImage extends SignupState {
  PlatformFile? imageHash;
  ChangeImage({this.imageHash});
}

class UploadProccess extends SignupState {
  int proccess;
  UploadProccess({this.proccess = 0});
}

class UploadSuccess extends SignupState {}

class UploadError extends SignupState {
  String? error;

  UploadError({this.error});
}

class FirstnameChecked extends SignupState {
  bool state;
  FirstnameChecked({this.state = true});
}

class LastnameChecked extends SignupState {
  bool state;
  LastnameChecked({this.state = true});
}

class EmailChecked extends SignupState {
  bool state;
  EmailChecked({this.state = true});
}

class UpdateSuccess extends SignupState {
  String userId;
  UpdateSuccess(this.userId);
}

class UpdateFailure extends SignupState {
  String? message;

  UpdateFailure({this.message});
}
