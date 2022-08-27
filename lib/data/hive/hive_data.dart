import 'package:callimoo/data/network/dto/user/user_dto.dart';
import 'package:hive/hive.dart';

import 'hive_name.dart';
import 'objects/user_object.dart';

class HiveData {
  late Box box;
  HiveData() {
    open();
  }

  open() async {
    box = await Hive.openBox('limoo');
  }

  setUser(UserDto user) {
    UserObject u = UserObject()
      ..uid = user.uid
      ..number = user.phoneNumber
      ..email = user.email
      ..avatar = user.avatarHash
      ..first_name = user.firstName
      ..last_name = user.lastName;
    if (box.isOpen) {
      box.put(HiveObjectName.userData, u);
    }else {
      box = Hive.box('limoo');
      box.put(HiveObjectName.userData, u);
    }
  }

  getUser() {
    return box.get(HiveObjectName.userData);
  }

  setLastWorkspace(String wid){
    if (box.isOpen) {
      box.put(HiveObjectName.lastWorkspace, wid);
    }else {
      box = Hive.box('limoo');
      box.put(HiveObjectName.lastWorkspace, wid);
    }
  }

  getLastWorkspace() {
    return box.get(HiveObjectName.lastWorkspace);
  }

  close() {
    box.close();
  }
}
