import 'package:callimoo/data/hive/dto/app_dto.dart';
import 'package:callimoo/data/network/dto/user/user_dto.dart';
import 'package:callimoo/data/repositories/user_repository.dart';
import 'package:callimoo/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'services_state.dart';

class ServicesCubit extends Cubit<ServicesState> {
  UserRepository _userRepository;
  UserDto? user;
  ServicesCubit({UserRepository? userRepository})
      : _userRepository = userRepository ?? UserRepository.getInstance,
        super(ServicesInitState()) {
          getUserInformation();
        }

  getUserInformation() async {
    user = AppDto.getUserInfo;
    if (user != null) {
      emit(LoadUserDataState(user!));
    } else {
      var response = await _userRepository.getUser();

      response.when(success: (success) {
        user = success;
        emit(LoadUserDataState(user!));
      }, failure: (failure) {
        print("cant laod data");
      });
    }
  }
}
