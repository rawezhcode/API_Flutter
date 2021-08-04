import 'package:flutter/foundation.dart';

class Post{
  final int? userId;
  final int? id;
  final String? title;
  final String? body;

  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

 factory Post.fromJSON(Map<String,dynamic> jsonData){
   return Post(
     userId: jsonData['userId'],
     id: jsonData['id'],
     title: jsonData['title'],
     body: jsonData['body'],
   );
 }

}

class Posts{
  final List<dynamic> postList;

  Posts({required this.postList});

  factory Posts.fromJSON(Map<String,dynamic> jsonData){
    return Posts(
      postList: jsonData['postList'],
    );
  }

}