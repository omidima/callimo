

import 'dart:async';

import 'package:callimoo/data/network/dto/conversation/conversation_dto.dart';
import 'package:callimoo/data/network/dto/user/user_dto.dart';
import 'package:callimoo/data/network/dto/workspace/workspace_dto.dart';

import 'resource.dart';

class DataSubscription {


  StreamSubscription<Resource<List<UserDto>>>? userSubscription = null;
  StreamSubscription<Resource<List<ConversationDto>>>? conversationSubscription = null;
  StreamSubscription<Resource<List<WorkspaceDto>>>? workspaceSubscription = null;
}