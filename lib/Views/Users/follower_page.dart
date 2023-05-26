import 'package:flutter/material.dart';
import '../../Models/Entities/user.dart';
import '../../Models/EntityManagers/users_manager.dart';

class UserFollowerPage extends StatefulWidget {
  const UserFollowerPage({Key? key}) : super(key: key);

  @override
  State<UserFollowerPage> createState() => _UserFollowerPageState();
}

class _UserFollowerPageState extends State<UserFollowerPage> {
  List<User>? postList = <User>[];
  var isLoaded = false;

  @override
  void initState() {
    super.initState();

    getData("746d58af90f05afb108fd4f4b0b0f39e811b5c33");
  }

  void getData(String userToken) async {
    var apiResponse = await UsersManager.getFollowerUserList(userToken);
    if (apiResponse["status"] == 1) {
      postList =
          List<User>.from(apiResponse["List"].map((x) => User.fromJson(x)));
      setState(() {
        isLoaded = true;
      });
    } else {
      apiResponse["errors"].map((error) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Erreur"),
              content: Text(error),
              actions: [
                TextButton(
                  child: const Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              backgroundColor: Colors.white,
              elevation: 5,
            );
          },
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Followers"),
      ),
      body: Visibility(
        visible: isLoaded,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
          itemCount: postList?.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  height: 50,
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            NetworkImage(postList![index].imagePath),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(postList![index].username,
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(width: 5),
                      Image.asset(
                        'assets/images/verification-badge.png',
                        height: 13,
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.more_horiz),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
