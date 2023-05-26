import 'package:flutter/material.dart';
import 'package:geek_book/Models/EntityManagers/posts_manager.dart';

import '../../Models/Entities/post.dart';
import '../../config/api.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  List<Post>? postList = <Post>[];
  var isLoaded = false;

  @override
  void initState() {
    super.initState();

    getData("746d58af90f05afb108fd4f4b0b0f39e811b5c33");
  }

  void getData(String userToken) async {
    var apiResponse = await PostsManager.getFollowingismPostList(userToken);
    if (apiResponse["status"] == 1) {
      postList = List<Post>.from(
          apiResponse["publicationList"].map((x) => Post.fromJson(x)));
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
        title: const Text("Pots"),
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
                            NetworkImage(postList![index].userImagePath),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(postList![index].userUsername,
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
                Visibility(
                    visible: postList![index].imagePath != null,
                    child: Container(
                      height: 300,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(postList![index].imagePath!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.favorite_outline),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.message_outlined),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.send_outlined),
                    ),
                    Expanded(child: Container()),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.bookmark_outline),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 10,
                        backgroundImage:
                            NetworkImage(postList![index].userImagePath),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      RichText(
                        text: TextSpan(
                          text: "Aimé par ",
                          style: DefaultTextStyle.of(context).style,
                          children: [
                            TextSpan(
                                text: postList![index].userUsername,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600)),
                            const TextSpan(text: " et "),
                            const TextSpan(
                                text: "123 autres persones",
                                style: TextStyle(fontWeight: FontWeight.w600)),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            postList![index].userUsername,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                              child: Text(
                            postList![index].content,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          )),
                          const SizedBox(width: 5),
                          Text(
                            'See more',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.grey.shade400),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "See 35 comments",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade400),
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
