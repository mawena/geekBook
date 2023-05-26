import 'dart:convert';

List<Post> postFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));
String postToJson(List<Post> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
  Post({
    required this.token,
    required this.title,
    required this.type,
    required this.content,
    required this.imagePath,
    required this.creationDate,
    required this.updateDate,
    required this.nbrComment,
    required this.nbrLike,
    required this.userToken,
    required this.userUsername,
    required this.userImagePath,
  });
  String token = "";
  String title = "";
  String type = "";
  String content = "";
  String? imagePath = "";
  String creationDate = "";
  String updateDate = "";
  int nbrComment = 0;
  int nbrLike = 0;
  String userToken = "";
  String userUsername = "";
  String userImagePath = "";

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        token: json["token"] as String,
        title: json["title"] as String,
        type: json["type"] as String,
        imagePath: json["imagePath"] as String?,
        content: json["content"] as String,
        creationDate: json["creationDate"] as String,
        updateDate: json["updateDate"] as String,
        nbrComment: json["nbrComment"] as int,
        nbrLike: json["nbrLike"] as int,
        userToken: json["userToken"] as String,
        userUsername: json["userUsername"] as String,
        userImagePath: json["userImagePath"] as String,
      );
  Map<String, dynamic> toJson() => {
        'token': token,
        'title': title,
        'type': type,
        'content': content,
        'imagePath': imagePath,
        'creationDate': creationDate,
        'updateDate': updateDate,
        'nbrComment': nbrComment,
        'nbrLike': nbrLike,
        'userToken': userToken,
        'userUsername': userUsername,
        'userImagePath': userImagePath,
      };
}
