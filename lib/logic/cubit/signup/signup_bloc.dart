import 'dart:io';
import 'package:callimoo/data/base/pref_key.dart';
import 'package:callimoo/data/base/resource.dart';
import 'package:callimoo/data/hive/dto/app_dto.dart';
import 'package:callimoo/data/network/dto/conversation/conversation_dto.dart';
import 'package:callimoo/data/network/dto/workspace/workspace_create_dto.dart';
import 'package:callimoo/data/network/dto/workspace/workspace_dto.dart';
import 'package:callimoo/data/repositories/conversation_repository.dart';
import 'package:callimoo/data/repositories/workspace_repository.dart';
import 'package:callimoo/main.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/network/dto/message/signup_user_dto.dart';
import '../../../../data/repositories/user_repository.dart';
part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  UserRepository repository;
  WorkspaceRepository workspaceRepository;
  ConversationRepository conversationRepository;
  String? name;
  String? lastname;
  String? email;
  String? imageHash;

  SignupCubit(
      {UserRepository? repository,
      WorkspaceRepository? workspaceRepository,
      ConversationRepository? conversationRepository})
      : repository = repository ?? UserRepository.getInstance,
        workspaceRepository =
            workspaceRepository ?? WorkspaceRepository.getInstance,
        conversationRepository =
            conversationRepository ?? ConversationRepository.getInstance,
        super(StartSignup());

  changeFirstname(String? value) {
    if (value == null || value.isEmpty) {
      emit(FirstnameChecked(state: false));
    } else {
      name = value;
      emit(FirstnameChecked(state: true));
    }
  }

  changeLastname(String? value) {
    if (value == null || value.isEmpty) {
      emit(LastnameChecked(state: false));
    } else {
      lastname = value;
      emit(LastnameChecked(state: true));
    }
  }

  String? emailChecker(String email) {
    RegExp r = RegExp(r'.[a-zA-z0-9\._]*@.[a-zA-Z]*\.[a-z]*');
    String email =
        "qwervbjkqerv qwevjb qjkw rvomid8144@gmail.com iubewvliba'vbiwebv'wbeivwr vwrjbkv;qwbrv";

    var m = r.allMatches(email);
    if (m.isNotEmpty) {
      return m.first.group(0)!.replaceAll(" ", "");
    } else {
      return null;
    }
  }

  changeEmail(String? value) {
    if (emailChecker(value.toString()) == null) {
      emit(EmailChecked(state: false));
    } else {
      email = value;
      emit(EmailChecked(state: true));
    }
  }

  submit() async {
    if (name != null && lastname != null) {
      var result = await repository.userSignup(SignupUserDto(
        first_name: this.name,
        last_name: this.lastname,
        email: "exaxmple@gmail.com",
        avatar_hash: imageHash,
      ));
      result.when(
        success: (data) async {
          await _configSetting();
          emit(UpdateSuccess(data.uid!));
        },
        failure: (error) => {
          print('error: ${error.toString()}'),
          emit(UpdateFailure(message: error.toString()))
        },
      );
    } else {
      changeFirstname(name);
      changeLastname(lastname);
      // changeEmail(email);
      emit(UpdateFailure());
    }
  }

  _configSetting() async {
    var workspace =
        await workspaceRepository.createWorkspace(WorkspaceCreateDto(
      displayName: "call_log",
    ));

    workspace.when(
        success: (success) async {
          AppDto.setWorkspace(success);
          var conversations =
              await repository.getUserConversations(success.id!, "");
          if (conversations.status == ResourceStatus.success) {
            conversations.data?.forEach((element) {
              if (element.displayName == "لابی") {
                AppDto.setConversation(element);
              }
            });
          }
        },
        failure: (failure) {});
  }
}
