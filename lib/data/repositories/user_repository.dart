import 'package:callimoo/data/hive/dto/app_dto.dart';
import 'package:dio/dio.dart';

import 'package:callimoo/data/network/dto/conversation/conversation_dto.dart';
import 'package:callimoo/data/network/dto/workspace/workspace_dto.dart';
import 'package:callimoo/logic/util/helper.dart';
import 'package:callimoo/main.dart';

import '../base/NetworkBoundResource.dart';
import '../base/api_wrapper.dart';
import '../base/base_repository.dart';
import '../base/pref_key.dart';
import '../base/resource.dart';
import '../network/dto/message/signup_user_dto.dart';
import '../network/dto/user/phone_number_dto.dart';
import '../network/dto/user/user_dto.dart';

class UserRepository extends BaseRepository {
  String userId = "";

  static final UserRepository _instance = UserRepository._internal();
  UserRepository._internal();
  static UserRepository get getInstance => _instance;

  Future<ApiWrapper<void>> phoneVerification(PhoneNumberDto phoneNumber) async {
    try {
      return ApiWrapper.success(
          data: await restProvider.phoneVerification(phoneNumber));
    } catch (error) {
      return ApiWrapper.failure(error: error);
    }
  }

  Future<ApiWrapper<UserDto>> otpRegistration(
      String phoneNumber, String otpToken) async {
    try {
      var result =
          await restProvider.otpRegistration(phoneNumber, otpToken, "");
      await Callimoo.config.put(PrefKey.USER_ID, result.data.id!);
      await Callimoo.config.put(
        PrefKey.ACCESS_TOKEN,
        tokenFinder(result.response.headers.toString()),
      );
      await Callimoo.config.put(
        PrefKey.REFRESH_TOKEN,
        refreshTokenFinder(result.response.headers.toString()),
      );
      return ApiWrapper.success(data: result.data);
    } catch (error) {
      if (error is DioError) {
        if (error.response!.statusCode == 427) {
          // await Callimoo.config.put(PrefKey.USER_ID, error.data.id!);
          await Callimoo.config.put(
            PrefKey.ACCESS_TOKEN,
            tokenFinder(error.response!.headers.toString()),
          );
          await Callimoo.config.put(
            PrefKey.REFRESH_TOKEN,
            refreshTokenFinder(error.response!.headers.toString()),
          );

          return ApiWrapper.success(data: UserDto(id: "427"));
        }
      }
      return ApiWrapper.failure(error: error);
    }
  }

  Future<ApiWrapper<UserDto>> getUser() async {
    try {
      var currentUser = await restProvider.getUser();
      AppDto.setUserInfo(currentUser);
      return ApiWrapper.success(data: currentUser);
    } catch (error) {
      return ApiWrapper.failure(error: error);
    }
  }

  Future<Resource<List<WorkspaceDto>>> getUserWorkspaces() async {
    return await NetworkBoundResource<List<WorkspaceDto>, List<WorkspaceDto>>()
        .asFutureNetwotk(createCall: () async {
      return await restProvider.getUserWorkspaces();
    });
  }

  Future<Resource<List<ConversationDto>>> getUserConversations(
      String workspaceId, String query) async {
    return await NetworkBoundResource<List<ConversationDto>,
            List<ConversationDto>>()
        .asFutureNetwotk(createCall: () async {
      List<ConversationDto> conversations =
          await restProvider.getUserConversations(workspaceId, query, true);
      return conversations;
    });
  }

  Future<ApiWrapper<UserDto>> userSignup(SignupUserDto data) async {
    try {
      var result = await restProvider.userSignup(data);
      await Callimoo.config.put(PrefKey.USER_ID, result.data.id!);
      return ApiWrapper.success(data: result.data);
    } catch (error) {
      return ApiWrapper.failure(error: error);
    }
  }

  Future<Resource<UserDto>> getUserInformation(List<String> userId) async {
    return await NetworkBoundResource<UserDto, UserDto>().asFutureNetwotk(
        createCall: () async {
      var r = await restProvider.getUsersInformation(userId);
      return r[0];
    });
  }
}
