import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project02/model/post.dart';


   
class PostApi{

     var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');

 static  Future<List<Post>> fetchData() async {
	  // final res = await http.get(url);

    // if (res.statusCode == 200) {
        // String data = res.body;
        // var jsonData = jsonDecode(data);
        Posts posts = Posts.fromJSON(
           {
              "postList": [
                {
                  "userId": 1,
                  "id": 1,
                  "title":
                      "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
                  "body":
                      "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
                },
                {
                  "userId": 1,
                  "id": 2,
                  "title": "qui est esse",
                  "body":
                      "est rerum tempore vitae\nsequi sint nihil reprehenderit dolor beatae ea dolores neque\nfugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis\nqui aperiam non debitis possimus qui neque nisi nulla"
                }
              ]
            }
        );
        List<Post> pList = posts.postList.map((e) => Post.fromJSON(e)).toList();
        return pList;


    // }
    // else{
    //   print("statusCode ${res.statusCode}");
    // }
    
	}

}