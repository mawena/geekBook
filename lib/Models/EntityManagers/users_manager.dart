import 'package:geek_book/Models/EntityManagers/manager.dart';

class UsersManager extends Manager {
  static Future<Map<String, dynamic>> getFollowerUserList(
      String userToken) async {
    return await Manager.getResponse("user/follower/$userToken");
  }

  static Future<Map<String, dynamic>> getFollowupUserList(
      String userToken) async {
    return await Manager.getResponse("user/followup/$userToken");
  }

  static Future<Map<String, dynamic>> getSearchUserList(String world) async {
    return await Manager.getResponse("user/search?world=$world");
  }
}
