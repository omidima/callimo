import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/network/dto/user/phone_number_dto.dart';
import '../../../../data/repositories/user_repository.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(InitLoginState());
  String phoneNumber = '';

  UserRepository userRepository = UserRepository.getInstance;

  changeNumber(String number) {
    if ((state is LoginFailer)) {
      phoneNumber = '';
    } else {
      phoneNumber = number;
    }
  }

  checkNumber(bool check, String number) {
    if (!check) {
      phoneNumber = '';
      emit(NumberInvalide());
    } else {
      emit(NumberValide());
      phoneNumber = number;
    }
  }

  phoneVerification() async {
    if (phoneNumber.isNotEmpty) {
      emit(LoginLoading());
      var result = await userRepository
          .phoneVerification(PhoneNumberDto(phoneNumber: phoneNumber));
      result.when(success: (mNull) {
        emit(LoginSuccess());
      }, failure: (error) {
        print(error);
        emit(LoginFailer());
      });
    } else {
      emit(LoginFailer(error: 'شماره موبایل خود را وارد نمایید'));
    }
  }
}
