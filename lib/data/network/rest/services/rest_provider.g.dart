// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_provider.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _RestProvider implements RestProvider {
  _RestProvider(this._dio, {this.baseUrl});

  final Dio _dio;

  String? baseUrl;

  @override
  Future<ConfigDto> config() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ConfigDto>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'api/v1/config',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ConfigDto.fromJson(_result.data!);
    return value;
  }

  @override
  Future<StatusDto> attachDevice(attachDeviceDto) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(attachDeviceDto.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<StatusDto>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'api/v1/session/attach_device',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = StatusDto.fromJson(_result.data!);
    return value;
  }

  @override
  Future<FileInfoDto> getFileInformation(fileHash) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'hash': fileHash};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<FileInfoDto>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'api/v1/files/info',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = FileInfoDto.fromJson(_result.data!);
    return value;
  }

  @override
  Future<dynamic> phoneVerification(phoneNumber) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(phoneNumber.toJson());
    final _result = await _dio.fetch(_setStreamType<dynamic>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, 'api/v1/user/phone_verification',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    return value;
  }

  @override
  Future<HttpResponse<UserDto>> otpRegistration(
      phoneNumber, otpToken, deviceKey) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'j_phoneNumber': phoneNumber,
      r'j_otpToken': otpToken,
      r'j_deviceKey': deviceKey
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<UserDto>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'j_spring_otptoken_security_check',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UserDto.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<UserDto>> usernameLogin(username, password) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'j_username': username,
      r'j_password': password
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<UserDto>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'j_spring_security_check',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UserDto.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<List<WorkspaceDto>> getUserWorkspaces() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<WorkspaceDto>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'api/v1/user/my_workspaces',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => WorkspaceDto.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<ConversationDto>> getUserConversations(
      workspaceId, query, includeArchived) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'query': query,
      r'include_archived': includeArchived
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<ConversationDto>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options,
                    'api/v1/workspace/items/${workspaceId}/conversation/items',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => ConversationDto.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<UserDto>> searchUser(
      workspaceId, page, perPage, searchResult) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page': page,
      r'per_page': perPage
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(searchResult.toJson());
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<UserDto>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options,
                    'api/v1/workspace/items/${workspaceId}/members/search',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => UserDto.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<UserDto>> getExistedWorkspaceMembers(
      workspaceId, page, perPage, searchResult) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page': page,
      r'per_page': perPage
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(searchResult.toJson());
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<UserDto>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options,
                    'api/v1/workspace/items/${workspaceId}/members/search',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => UserDto.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<HttpResponse<UserDto>> userSignup(request) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<UserDto>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'api/v1/user/signup',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UserDto.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<UserDto> getUser() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<UserDto>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'api/v1/user/items/self',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UserDto.fromJson(_result.data!);
    return value;
  }

  @override
  Future<HttpResponse<dynamic>> getSessionByKeycloak() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch(_setStreamType<HttpResponse<dynamic>>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, 'api/v1/session/by_keycloak',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<List<WorkspaceMemberDto>> getWorkspaceMembers(workspaceId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<WorkspaceMemberDto>>(Options(
                method: 'GET', headers: _headers, extra: _extra)
            .compose(
                _dio.options, 'api/v1/workspace/items/${workspaceId}/members',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) =>
            WorkspaceMemberDto.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<WorkspaceUnreadDto> getWorkspaceUnread(workspaceId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<WorkspaceUnreadDto>(Options(
                method: 'GET', headers: _headers, extra: _extra)
            .compose(
                _dio.options, 'api/v1/workspace/items/${workspaceId}/unread',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = WorkspaceUnreadDto.fromJson(_result.data!);
    return value;
  }

  @override
  Future<WorkspaceDto> getWorkspaceInformation(workspaceId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<WorkspaceDto>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'api/v1/workspace/items/${workspaceId}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = WorkspaceDto.fromJson(_result.data!);
    return value;
  }

  @override
  Future<WorkspaceDto> createWorkspace(workspaceDto) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(workspaceDto.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<WorkspaceDto>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'api/v1/workspace/items',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = WorkspaceDto.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ExistsDto> checkExistsWorkspaceName(name) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ExistsDto>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'api/v1/workspace/check_name',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ExistsDto.fromJson(_result.data!);
    return value;
  }

  @override
  Future<StatusDto> invateUsersToWorkspace(data) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(data.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<StatusDto>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'api/v1/user/invitation/items/',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = StatusDto.fromJson(_result.data!);
    return value;
  }

  @override
  Future<dynamic> viewConversation(workspaceId, conversationId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch(_setStreamType<dynamic>(Options(
            method: 'POST', headers: _headers, extra: _extra)
        .compose(_dio.options,
            'api/v1/workspace/items/${workspaceId}/conversation/items/${conversationId}/view_log',
            queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    return value;
  }

  @override
  Future<ConversationDto> createGroup(workspaceId, createGroup) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(createGroup.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ConversationDto>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options,
                    'api/v1/workspace/items/${workspaceId}/conversation/items',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ConversationDto.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ConversationDto> getConversationInfo(
      workspaceId, conversationId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
        ConversationDto>(Options(
            method: 'GET', headers: _headers, extra: _extra)
        .compose(_dio.options,
            'api/v1/workspace/items/${workspaceId}/conversation/items/${conversationId}',
            queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ConversationDto.fromJson(_result.data!);
    return value;
  }

  @override
  Future<List<ConversationMemberDto>> getConversationMembers(
      workspaceId, conversationId, page, perPage) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page': page,
      r'per_page': perPage
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(_setStreamType<
        List<ConversationMemberDto>>(Options(
            method: 'GET', headers: _headers, extra: _extra)
        .compose(_dio.options,
            'api/v1/workspace/items/${workspaceId}/conversation/items/${conversationId}/members/items',
            queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) =>
            ConversationMemberDto.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<BbbDto> createVideoCall(workspaceId, conversationId, name) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(name.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
        BbbDto>(Options(
            method: 'POST', headers: _headers, extra: _extra)
        .compose(_dio.options,
            'api/v1/workspace/items/${workspaceId}/conversation/items/${conversationId}/bbb/create_meeting',
            queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BbbDto.fromJson(_result.data!);
    return value;
  }

  @override
  Future<List<ConversationMemberDto>> addMemberToConversation(
      workspaceId, conversationId, conversationInvitationList) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = conversationInvitationList.map((e) => e.toJson()).toList();
    final _result = await _dio.fetch<List<dynamic>>(_setStreamType<
        List<ConversationMemberDto>>(Options(
            method: 'POST', headers: _headers, extra: _extra)
        .compose(_dio.options,
            'api/v1/workspace/items/${workspaceId}/conversation/items/${conversationId}/members/batch',
            queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) =>
            ConversationMemberDto.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<MessageDto>> getMessages(
      workspaceId, conversationId, page, perPage) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page': page,
      r'per_page': perPage
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(_setStreamType<
        List<MessageDto>>(Options(
            method: 'GET', headers: _headers, extra: _extra)
        .compose(_dio.options,
            'api/v1/workspace/items/${workspaceId}/conversation/items/${conversationId}/message/items',
            queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => MessageDto.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<MessageDto> createMessage(
      workspaceId, conversationId, createMessage) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(createMessage.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
        MessageDto>(Options(
            method: 'POST', headers: _headers, extra: _extra)
        .compose(_dio.options,
            'api/v1/workspace/items/${workspaceId}/conversation/items/${conversationId}/message/items',
            queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MessageDto.fromJson(_result.data!);
    return value;
  }

  @override
  Future<MessageDto> updateMessage(
      workspaceId, conversationId, messageId, updateMessage) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(updateMessage.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
        MessageDto>(Options(
            method: 'POST', headers: _headers, extra: _extra)
        .compose(_dio.options,
            'api/v1/workspace/items/${workspaceId}/conversation/items/${conversationId}/message/items/${messageId}',
            queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MessageDto.fromJson(_result.data!);
    return value;
  }

  @override
  Future<StatusDto> deleteMessage(
      workspaceId, conversationId, messageId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
        StatusDto>(Options(
            method: 'DELETE', headers: _headers, extra: _extra)
        .compose(_dio.options,
            'api/v1/workspace/items/${workspaceId}/conversation/items/${conversationId}/message/items/${messageId}',
            queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = StatusDto.fromJson(_result.data!);
    return value;
  }

  @override
  Future<List<UserDto>> getUsersInformation(userId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = userId;
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<UserDto>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'api/v1/user/ids',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => UserDto.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<StatusDto> addReaction(
      workspace_id, conversation_id, message_id, emoji_name) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
        StatusDto>(Options(
            method: 'POST', headers: _headers, extra: _extra)
        .compose(_dio.options,
            'api/v1/workspace/items/${workspace_id}/conversation/items/${conversation_id}/message/items/${message_id}/reaction/items/${emoji_name}',
            queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = StatusDto.fromJson(_result.data!);
    return value;
  }

  @override
  Future<StatusDto> removeReaction(
      workspace_id, conversation_id, message_id, emoji_name) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
        StatusDto>(Options(
            method: 'DELETE', headers: _headers, extra: _extra)
        .compose(_dio.options,
            'api/v1/workspace/items/${workspace_id}/conversation/items/${conversation_id}/message/items/${message_id}/reaction/items/${emoji_name}',
            queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = StatusDto.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ThreadDto> getThreadByMessageId(workspaceId, messageId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
        ThreadDto>(Options(
            method: 'GET', headers: _headers, extra: _extra)
        .compose(_dio.options,
            'api/v1/workspace/items/${workspaceId}/thread/items/${messageId}',
            queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ThreadDto.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ThreadUnreadDto> getThreadUnreadAndMentionCount(workspaceId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ThreadUnreadDto>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options,
                    'api/v1/workspace/items/${workspaceId}/thread/unreads',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ThreadUnreadDto.fromJson(_result.data!);
    return value;
  }

  @override
  Future<AllThreadDto> getThreadByWorkspaceId(
      workspaceId, page, perPage) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page': page,
      r'per_page': perPage
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<AllThreadDto>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options,
                    'api/v1/workspace/items/${workspaceId}/thread/all_threads',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AllThreadDto.fromJson(_result.data!);
    return value;
  }

  @override
  Future<StatusDto> viewThread(
      workspaceId, rootMessageId, viewThreadDto) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(viewThreadDto.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
        StatusDto>(Options(
            method: 'POST', headers: _headers, extra: _extra)
        .compose(_dio.options,
            'api/v1/workspace/items/${workspaceId}/thread/items/${rootMessageId}/view_log',
            queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = StatusDto.fromJson(_result.data!);
    return value;
  }

  @override
  Future<List<TaskDto>> getListAllTask(workspace_id, page, per_page) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page': page,
      r'per_page': per_page
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<TaskDto>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options,
                    'api/v1/workspace/items/${workspace_id}/task/items',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => TaskDto.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<TaskDto> addNewTasks(workspace_id, task) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(task.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TaskDto>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options,
                    'api/v1/workspace/items/${workspace_id}/task/items',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TaskDto.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TaskDto> taskChangeState(workspace_id, task_id, state) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(state.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
        TaskDto>(Options(
            method: 'POST', headers: _headers, extra: _extra)
        .compose(_dio.options,
            'api/v1/workspace/items/${workspace_id}/task/items/${task_id}/state',
            queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TaskDto.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TaskDto> taskUpdate(workspace_id, task_id, task) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(task.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TaskDto>(Options(
                method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options,
                'api/v1/workspace/items/${workspace_id}/task/items/${task_id}',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TaskDto.fromJson(_result.data!);
    return value;
  }

  @override
  Future<StatusDto> taskRemove(workspace_id, task_id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<StatusDto>(Options(
                method: 'DELETE', headers: _headers, extra: _extra)
            .compose(_dio.options,
                'api/v1/workspace/items/${workspace_id}/task/items/${task_id}',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = StatusDto.fromJson(_result.data!);
    return value;
  }

  @override
  Future<List<MessageDto>> getSearchResult(
      workspace_id, page, per_page, data) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page': page,
      r'per_page': per_page
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(data.toJson());
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<MessageDto>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options,
                    'api/v1/workspace/items/${workspace_id}/message_search',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => MessageDto.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<OrganizationMember> getOrganizationUsers(orgId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
        OrganizationMember>(Options(
            method: 'GET', headers: _headers, extra: _extra)
        .compose(_dio.options,
            'api/v1/organization/items/${orgId}/members/for_public?per_page=1000',
            queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = OrganizationMember.fromJson(_result.data!);
    return value;
  }

  @override
  Future<List<OrganizationDto>> getUserOrganizations() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<OrganizationDto>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'api/v1/user/my_organizations',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => OrganizationDto.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
