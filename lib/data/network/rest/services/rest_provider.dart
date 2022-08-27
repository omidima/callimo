import 'dart:async';

import 'package:dio/dio.dart';

import 'package:retrofit/retrofit.dart';

import '../../dto/config/attach_device_dto.dart';
import '../../dto/config/config_dto.dart';
import '../../dto/conversation/bbb_dto.dart';
import '../../dto/conversation/conversation_dto.dart';
import '../../dto/conversation/conversation_invitation.dart';
import '../../dto/conversation/conversation_member_dto.dart';
import '../../dto/conversation/create_group.dart';
import '../../dto/exists_dto.dart';
import '../../dto/files/files_dto.dart';
import '../../dto/message/create_message.dart';
import '../../dto/message/message_dto.dart';
import '../../dto/message/signup_user_dto.dart';
import '../../dto/message/update_message.dart';
import '../../dto/organization/organization_dto.dart';
import '../../dto/organization/organization_member_dto.dart';
import '../../dto/search/search_request.dart';
import '../../dto/status_dto.dart';
import '../../dto/tasks/task_state_dto.dart';
import '../../dto/tasks/tasks_dto.dart';
import '../../dto/thread/all_thread_dto.dart';
import '../../dto/thread/thread_dto.dart';
import '../../dto/thread/thread_unread_dto.dart';
import '../../dto/thread/view_thread_dto.dart';
import '../../dto/user/phone_number_dto.dart';
import '../../dto/user/search_result.dart';
import '../../dto/user/user_dto.dart';
import '../../dto/workspace/invate_user_dto.dart';
import '../../dto/workspace/workspace_create_dto.dart';
import '../../dto/workspace/workspace_dto.dart';
import '../../dto/workspace/workspace_member_dto.dart';
import '../../dto/workspace/workspace_unread_dto.dart';

part 'rest_provider.g.dart';

@RestApi()
abstract class RestProvider {
  factory RestProvider(Dio dio, {String baseUrl}) = _RestProvider;

  //-------------------- CONFIG -------------------
  @GET("api/v1/config")
  Future<ConfigDto> config();

  @POST("api/v1/session/attach_device")
  Future<StatusDto> attachDevice(@Body() AttachDeviceDto attachDeviceDto);

  @GET('api/v1/files/info')
  Future<FileInfoDto> getFileInformation(@Query('hash') String fileHash);

  //-------------------- USER ---------------------
  @POST("api/v1/user/phone_verification")
  Future phoneVerification(@Body() PhoneNumberDto phoneNumber);

  @POST("j_spring_otptoken_security_check")
  Future<HttpResponse<UserDto>> otpRegistration(
      @Query("j_phoneNumber") String phoneNumber,
      @Query("j_otpToken") String otpToken,
      @Query("j_deviceKey") String deviceKey);

  @POST("j_spring_security_check")
  Future<HttpResponse<UserDto>> usernameLogin(
    @Query("j_username") String username,
    @Query("j_password") String password,
  );

  @GET("api/v1/user/my_workspaces")
  Future<List<WorkspaceDto>> getUserWorkspaces();

  @GET("api/v1/workspace/items/{workspace_id}/conversation/items")
  Future<List<ConversationDto>> getUserConversations(
      @Path("workspace_id") String workspaceId,
      @Query("query") String query,
      @Query("include_archived") bool includeArchived);

  @POST("api/v1/workspace/items/{workspace_id}/members/search")
  Future<List<UserDto>> searchUser(
      @Path("workspace_id") String workspaceId,
      @Query("page") int page,
      @Query("per_page") int perPage,
      @Body() SearchResult searchResult);

  @POST("api/v1/workspace/items/{workspace_id}/members/search")
  Future<List<UserDto>> getExistedWorkspaceMembers(
      @Path("workspace_id") String workspaceId,
      @Query("page") int page,
      @Query("per_page") int perPage,
      @Body() SearchResult searchResult);

  @POST("api/v1/user/signup")
  Future<HttpResponse<UserDto>> userSignup(@Body() SignupUserDto request);

  @GET("api/v1/user/items/self")
  Future<UserDto> getUser();

  @POST("api/v1/session/by_keycloak")
  Future<HttpResponse> getSessionByKeycloak();

  //-------------------- WORKSPACE ---------------------
  @GET("api/v1/workspace/items/{workspace_id}/members")
  Future<List<WorkspaceMemberDto>> getWorkspaceMembers(
      @Path("workspace_id") String workspaceId);

  @GET("api/v1/workspace/items/{workspace_id}/unread")
  Future<WorkspaceUnreadDto> getWorkspaceUnread(
      @Path("workspace_id") workspaceId);

  @GET("api/v1/workspace/items/{workspace_id}")
  Future<WorkspaceDto> getWorkspaceInformation(
      @Path("workspace_id") workspaceId);

  @POST("api/v1/workspace/items")
  Future<WorkspaceDto> createWorkspace(
    @Body() WorkspaceCreateDto workspaceDto,
  );

  @GET("api/v1/workspace/check_name")
  Future<ExistsDto> checkExistsWorkspaceName(@Path("name") String name);

  // @POST('api/v1/user/invitation/resolve')
  // Future<List<WorkspaceAcceptDto>> setAcceptWorkspaces(
  //     @Body() List<SelectedWorkspace> selectedWorkspaces);

  @POST('api/v1/user/invitation/items/')
  Future<StatusDto> invateUsersToWorkspace(
      @Body() WorkspaceInvationMemberDto data);
  //-------------------- CONVERSATION ---------------------
  @POST(
      "api/v1/workspace/items/{workspace_id}/conversation/items/{conversation_id}/view_log")
  Future viewConversation(@Path("workspace_id") String workspaceId,
      @Path("conversation_id") String conversationId);

  @POST("api/v1/workspace/items/{workspace_id}/conversation/items")
  Future<ConversationDto> createGroup(@Path("workspace_id") String workspaceId,
      @Body() CreateGroup createGroup);

  @GET(
      "api/v1/workspace/items/{workspace_id}/conversation/items/{conversation_id}")
  Future<ConversationDto> getConversationInfo(
      @Path("workspace_id") String workspaceId,
      @Path("conversation_id") String conversationId);

  // @GET(
  //     "api/v1/workspace/items/{workspace_id}/conversation/items/{conversation_id}/stats")
  // Future<ConversationMemberCount> getConversationMemberCount(
  //     @Path("workspace_id") String workspaceId,
  //     @Path("conversation_id") String conversationId);

  @GET(
      "api/v1/workspace/items/{workspace_id}/conversation/items/{conversation_id}/members/items")
  Future<List<ConversationMemberDto>> getConversationMembers(
    @Path("workspace_id") String workspaceId,
    @Path("conversation_id") String conversationId,
    @Query("page") int page,
    @Query("per_page") int perPage,
  );

  @POST(
      "api/v1/workspace/items/{workspace_id}/conversation/items/{conversation_id}/bbb/create_meeting")
  Future<BbbDto> createVideoCall(
      @Path("workspace_id") String workspaceId,
      @Path("conversation_id") String conversationId,
      @Body() VideoCallNameDto name);

  @POST(
      "api/v1/workspace/items/{workspace_id}/conversation/items/{conversation_id}/members/batch")
  Future<List<ConversationMemberDto>> addMemberToConversation(
      @Path("workspace_id") String workspaceId,
      @Path("conversation_id") String conversationId,
      @Body() List<ConversationInvitation> conversationInvitationList);

  //-------------------- MESSAGE ---------------------
  @GET(
      "api/v1/workspace/items/{workspace_id}/conversation/items/{conversation_id}/message/items")
  Future<List<MessageDto>> getMessages(
      @Path("workspace_id") String workspaceId,
      @Path("conversation_id") String conversationId,
      @Query("page") int page,
      @Query("per_page") int perPage);

  @POST(
      "api/v1/workspace/items/{workspace_id}/conversation/items/{conversation_id}/message/items")
  Future<MessageDto> createMessage(
      @Path("workspace_id") String workspaceId,
      @Path("conversation_id") String conversationId,
      @Body() CreateMessage createMessage);

  @POST(
      "api/v1/workspace/items/{workspace_id}/conversation/items/{conversation_id}/message/items/{message_id}")
  Future<MessageDto> updateMessage(
      @Path("workspace_id") String workspaceId,
      @Path("conversation_id") String conversationId,
      @Path("message_id") String messageId,
      @Body() UpdateMessage updateMessage);

  @DELETE(
      "api/v1/workspace/items/{workspace_id}/conversation/items/{conversation_id}/message/items/{message_id}")
  Future<StatusDto> deleteMessage(
      @Path("workspace_id") String workspaceId,
      @Path("conversation_id") String conversationId,
      @Path("message_id") String messageId);

  @POST("api/v1/user/ids")
  Future<List<UserDto>> getUsersInformation(@Body() List<String> userId);

  @POST(
      "api/v1/workspace/items/{workspace_id}/conversation/items/{conversation_id}/message/items/{message_id}/reaction/items/{emoji_name}")
  Future<StatusDto> addReaction(
    @Path("workspace_id") String workspace_id,
    @Path("conversation_id") String conversation_id,
    @Path("message_id") String message_id,
    @Path("emoji_name") String emoji_name,
  );

  @DELETE(
      "api/v1/workspace/items/{workspace_id}/conversation/items/{conversation_id}/message/items/{message_id}/reaction/items/{emoji_name}")
  Future<StatusDto> removeReaction(
    @Path("workspace_id") String workspace_id,
    @Path("conversation_id") String conversation_id,
    @Path("message_id") String message_id,
    @Path("emoji_name") String emoji_name,
  );

  //-------------------- PREFERENCES ---------------------
  // @GET("api/v1/user/preferences")
  // Future<List<pref.Preference>> getUserPreferences();

  //-------------------- THREAD ---------------------
  @GET("api/v1/workspace/items/{workspace_id}/thread/items/{message_id}")
  Future<ThreadDto> getThreadByMessageId(
      @Path("workspace_id") String workspaceId,
      @Path("message_id") String messageId);

  @GET("api/v1/workspace/items/{workspace_id}/thread/unreads")
  Future<ThreadUnreadDto> getThreadUnreadAndMentionCount(
      @Path("workspace_id") String workspaceId);

  @GET("api/v1/workspace/items/{workspace_id}/thread/all_threads")
  Future<AllThreadDto> getThreadByWorkspaceId(
      @Path("workspace_id") String workspaceId,
      @Query("page") int page,
      @Query("per_page") int perPage);

  @POST(
      "api/v1/workspace/items/{workspace_id}/thread/items/{root_message_id}/view_log")
  Future<StatusDto> viewThread(
      @Path("workspace_id") String workspaceId,
      @Path("root_message_id") String rootMessageId,
      @Body() ViewThreadDto viewThreadDto);

  // ----------- TASKS -------------
  @GET("api/v1/workspace/items/{workspace_id}/task/items")
  Future<List<TaskDto>> getListAllTask(
    @Path("workspace_id") String workspace_id,
    @Query("page") int page,
    @Query("per_page") int per_page,
  );

  @POST("api/v1/workspace/items/{workspace_id}/task/items")
  Future<TaskDto> addNewTasks(
      @Path("workspace_id") String workspace_id, @Body() TaskDto task);

  @POST("api/v1/workspace/items/{workspace_id}/task/items/{task_id}/state")
  Future<TaskDto> taskChangeState(@Path("workspace_id") String workspace_id,
      @Path("task_id") String task_id, @Body() TaskStateDto state);

  @POST("api/v1/workspace/items/{workspace_id}/task/items/{task_id}")
  Future<TaskDto> taskUpdate(@Path("workspace_id") String workspace_id,
      @Path("task_id") String task_id, @Body() TaskDto task);

  @DELETE("api/v1/workspace/items/{workspace_id}/task/items/{task_id}")
  Future<StatusDto> taskRemove(@Path("workspace_id") String workspace_id,
      @Path("task_id") String task_id);

  // --------------------- SEARCH OPTION ----------------------
  @POST("api/v1/workspace/items/{workspace_id}/message_search")
  Future<List<MessageDto>> getSearchResult(
      @Path("workspace_id") String workspace_id,
      @Query("page") String page,
      @Query("per_page") String per_page,
      @Body() SearchRequestDto data);

  // --------------------- ORGANIZATION ----------------------
  @GET('api/v1/organization/items/{organization_id}/members/for_public?per_page=1000')
  Future<OrganizationMember> getOrganizationUsers(
      @Path('organization_id') String orgId);

  @GET('api/v1/user/my_organizations')
  Future<List<OrganizationDto>> getUserOrganizations();

  // @POST('api/v1/organization/items/{organization_id}/workspace_request/items')
  // Future<StatusDto> createWorkspaceRequest(
  //     @Path('organization_id') String organizationId,
  //     @Body() CreateWorkspaceRequestDto createWorkspaceRequestDto);
}
