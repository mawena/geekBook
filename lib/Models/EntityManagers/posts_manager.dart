import 'manager.dart';

class PostsManager extends Manager {
  static Future<Map<String, dynamic>> getFollowingismPostList(
      String userToken) async {
    return await Manager.getResponse("publication/followingism/$userToken");
  }

  static Future<Map<String, dynamic>> getByUserToken(String userToken) async {
    return await Manager.getResponse("publication/user/$userToken");
  }

  static Future<Map<String, dynamic>> getTest() async {
    return await Manager.getResponse("publication");
  }
}
