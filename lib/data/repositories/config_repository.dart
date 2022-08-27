import 'package:callimoo/main.dart';

import '../base/api_wrapper.dart';
import '../base/base_repository.dart';
import '../network/dto/config/config_dto.dart';

class ConfigRepository extends BaseRepository {
  static final ConfigRepository _instance = ConfigRepository._internal();
  ConfigRepository._internal();
  static ConfigRepository get getInstance => _instance;

  Future<void> config() async {
    try {
      await ApiWrapper.success(data: await restProvider.getUserWorkspaces());
    } catch (error) {
      // return ApiWrapper.failure(
      //     error: error);
    }
  }
}
