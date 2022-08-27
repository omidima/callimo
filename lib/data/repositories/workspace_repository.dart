import 'dart:collection';

import '../base/api_wrapper.dart';
import '../base/base_repository.dart';
import '../network/dto/workspace/workspace_create_dto.dart';
import '../network/dto/workspace/workspace_dto.dart';

class WorkspaceRepository extends BaseRepository {
  static final WorkspaceRepository _instance = WorkspaceRepository._internal();
  WorkspaceRepository._internal();
  static WorkspaceRepository get getInstance => _instance;
  // UserDao userDatabase = App.DATABASE.userDao;
  // HashMap<String, UserDto> workspaceMember = HashMap();
  // HashMap<String, UserDto> existedWorkspaceMember = HashMap();
  // HashMap<String, UserDto> workspaceMemberByUserName = HashMap();
  // List<WorkspaceUnreadDto>? workspaceUnread = null;

  // reset() {
  //   workspaceMember.clear();
  //   workspaceMemberByUserName.clear();
  //   workspaceUnread?.clear();
  //   existedWorkspaceMember.clear();
  // }

  // Future<Resource<List<WorkspaceMemberDto>>> getWorkspaceMembers() async {
  //   return await NetworkBoundResource<List<WorkspaceMemberDto>,
  //           List<WorkspaceMemberDto>>()
  //       .asFutureNetwotk(
  //     createCall: () async {
  //       String currentWorkspaceId =
  //           await Pref.get(key: PrefKey.LAST_WORKSPACE_ID);

  //       return await restProvider.getWorkspaceMembers(currentWorkspaceId);
  //     },
  //     processResponse: (data) {
  //       data.forEach((element) {
  //         if (workspaceMember.containsKey(element.userId)) {
  //           workspaceMember[element.userId!] = workspaceMember[element.userId]!
  //               .copyWith(
  //                   avatarHash: element.avatarHash == null
  //                       ? workspaceMember[element.userId]!.avatarHash
  //                       : element.avatarHash,
  //                   nickname: element.nickname,
  //                   position: element.position);
  //         }
  //       });

  //       return data;
  //     },
  //   );
  // }

  // Future<ApiWrapper<List<UserDto>>> getExistedWorkspaceMembers() async {
  //   existedWorkspaceMember.clear();
  //   try {
  //     var response = await restProvider.getExistedWorkspaceMembers(
  //         await Pref.get(key: PrefKey.LAST_WORKSPACE_ID),
  //         0,
  //         -1,
  //         SearchResult(term: "", allowDeleted: false));
  //     response.forEach((user) {
  //       existedWorkspaceMember[user.id!] = user;
  //     });
  //     return ApiWrapper.success(data: response);
  //   } catch (error) {
  //     return ApiWrapper.failure(
  //         error: NetworkExceptions.getDioException(error));
  //   }
  // }

  // Future<Resource<List<WorkspaceUnreadDto>>> getWorkspaceUnread() async {
  //   return await NetworkBoundResource<WorkspaceUnreadDto,
  //           List<WorkspaceUnreadDto>>()
  //       .asFutureNetwotk(
  //     createCall: () async {
  //       String workspaceId = await Pref.get(key: PrefKey.LAST_WORKSPACE_ID);
  //       var temp = [await restProvider.getWorkspaceUnread(workspaceId)];
  //       workspaceUnread = temp;
  //       return temp;
  //     },
  //   );
  // }

  Future<ApiWrapper<WorkspaceDto>> createWorkspace(
      WorkspaceCreateDto workspaceDto) async {
    try {
      return ApiWrapper.success(
          data: await restProvider.createWorkspace(workspaceDto));
    } catch (e) {
      return ApiWrapper.failure(error: e);
    }
  }

  // Future<ApiWrapper<ExistsDto>> checkWorkspaceName(String name) async {
  //   try {
  //     return ApiWrapper.success(
  //         data: await restProvider.checkExistsWorkspaceName(name));
  //   } catch (e) {
  //     return ApiWrapper.failure(error: NetworkExceptions.getDioException(e));
  //   }
  // }

  // Future<Resource<List<WorkspaceAcceptDto>>> setAcceptedWorkspaces(
  //         List<SelectedWorkspace> items) async =>
  //     NetworkBoundResource<Workspace, List<WorkspaceAcceptDto>>()
  //         .asFutureNetwotk(
  //       createCall: () async {
  //         var result = await restProvider.setAcceptWorkspaces(items);
  //         return result;
  //       },
  //     );

  // Future<Resource<StatusDto>> sendUsersInvations(
  //         List<InvationUsersItem> userList, String workspaceId) async =>
  //     NetworkBoundResource<Workspace, StatusDto>().asFutureNetwotk(
  //       createCall: () async {
  //         var result = await restProvider.invateUsersToWorkspace(
  //             WorkspaceInvationMemberDto(
  //                 invations: userList, workspaceId: workspaceId));
  //         return result;
  //       },
  //     );

  // Stream<Resource<List<User>>> getWorkspaceUsers(String workspaceId) {
  //   return NetworkBoundResource<List<User>, List<UserDto>>().asStream(
  //       loadFromDb: userDatabase.streamData,
  //       shouldFetch: (data) {
  //         return true;
  //       },
  //       createCall: () async {
  //         return await restProvider.searchUser(
  //             workspaceId, 0, -1, SearchResult(term: "", allowDeleted: true));
  //       },
  //       processResponse: (serverResponse) {
  //         List<User> newList = [];
  //         serverResponse.forEach((e) {
  //           User user = UserConverter.convertToUser(e);
  //           workspaceMember[user.id] = e;
  //           workspaceMemberByUserName[user.username] = e;
  //           newList.add(user);
  //         });
  //         return newList;
  //       },
  //       saveCallResult: (databaseData) async {
  //         return userDatabase.insertAllData(databaseData);
  //       });
  // }
}
