import 'package:callimoo/data/base/config.dart';
import 'package:callimoo/data/base/pref_key.dart';
import 'package:callimoo/data/base/resource.dart';
import 'package:callimoo/data/hive/dto/app_dto.dart';
import 'package:callimoo/data/network/dto/config/config_dto.dart';
import 'package:callimoo/data/network/dto/workspace/workspace_dto.dart';
import 'package:callimoo/data/repositories/conversation_repository.dart';
import 'package:callimoo/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';

import '../../../../data/network/dto/user/phone_number_dto.dart';
import '../../../../data/repositories/user_repository.dart';
import '../../../data/network/dto/workspace/workspace_create_dto.dart';
import '../../../data/repositories/workspace_repository.dart';
part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  UserRepository userRepository;
  WorkspaceRepository workspaceRepository;
  ConversationRepository _conversationRepository;
  OtpCubit(
      {UserRepository? userRepository,
      WorkspaceRepository? workspaceRepository,
      ConversationRepository? conversationRepository})
      : userRepository = userRepository ?? UserRepository.getInstance,
        _conversationRepository =
            conversationRepository ?? ConversationRepository.getInstance,
        workspaceRepository =
            workspaceRepository ?? WorkspaceRepository.getInstance,
        super(InitState());

  String number = "";
  String code = "";

  submit() async {
    emit(OtpLoading());
    var result = await userRepository.otpRegistration(number, code);
    result.when(success: (user) async {
      if (user.id == "427") {
        emit(UserNeedSignup());
      } else {
        await _configSetting();
        emit(OtpSuccess());
      }
    }, failure: (error) {
      emit(OtpError());
    });
  }

  resendCode() async {
    emit(OtpLoading());
    var result = await userRepository
        .phoneVerification(PhoneNumberDto(phoneNumber: number));
    result.when(success: (mNull) {
      emit(InitState());
    }, failure: (error) {
      emit(OtpError());
    });
  }

  changeCode(String code) {
    this.code = code;

    if (code.isNotEmpty) {
      emit(HasCodeState());
    } else {
      emit(InitState());
    }
  }

  changeNumber(String number) {
    this.number = number;
  }

  invalidCode() {
    emit(OtpInvalidTime());
  }

  _configSetting() async {
    var workspaces = await userRepository.getUserWorkspaces();
    bool hasCallWorkspace = false;

    if (workspaces.status == ResourceStatus.success) {
      workspaces.data?.forEach((element) {
        if (element.displayName == ConfigApp.conversationName ||
            element.name == ConfigApp.conversationName) {
          hasCallWorkspace = true;
          AppDto.setWorkspace(element);
        }
      });
    }

    if (!hasCallWorkspace) {
      var workspace =
          await workspaceRepository.createWorkspace(WorkspaceCreateDto(
        displayName: ConfigApp.conversationName,
      ));
      workspace.when(
          success: (success) async {
            AppDto.setWorkspace(success);
            await _createConversation(success);
          },
          failure: (failure) {});
    }

    if (AppDto.getConversation == null) {
      await _createConversation(AppDto.getWorkspace!);
    }
  }

  _createConversation(WorkspaceDto workspaceDto) async {
    bool hasCallConversation = false;

    var conversations =
        await userRepository.getUserConversations(workspaceDto.id!, "");
    if (conversations.status == ResourceStatus.success) {
      conversations.data?.forEach((element) {
        if (element.displayName == ConfigApp.conversationName) {
          hasCallConversation = true;
          AppDto.setConversation(element);
        }
      });
    }

    if (!hasCallConversation) {
      var conversation =
          await _conversationRepository.createConversation(workspaceDto.id!);

      if (conversation.status == ResourceStatus.success) {
        AppDto.setConversation(conversation.data!);
      }
    }
  }
}
