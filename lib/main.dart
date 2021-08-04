import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import './services/postServices.dart';
import 'model/post.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController nameController= TextEditingController();
	TextEditingController emailController= TextEditingController();
	TextEditingController phoneNumberController= TextEditingController();

   bool visible = false ;
   Future webCall() async{
 
    // Showing CircularProgressIndicator using State.
    setState(() {
     visible = true ; 
    });
 
    // Getting value from Controller
    String name = nameController.text;
    String email = emailController.text;
    String phoneNumber = phoneNumberController.text;
 
    // API URL
   var url = Uri.parse('http://localhost/flutterConnect_mySql/register.php');
 
    // Store all data with Param Name.
    var data = {'name': name, 'email': email, 'mobile' : phoneNumber};
 
    // Starting Web Call with data.
    var response = await http.post(url, body: json.encode(data));
 
    // Getting Server response into variable.
    var message = jsonDecode(response.body);
 
    // If Web call Success than Hide the CircularProgressIndicator.
    if(response.statusCode == 200){
      setState(() {
       visible = false; 
      });
    }
 
    // Showing Alert Dialog with Response JSON.
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(message),
          actions: <Widget>[
            FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
 
  }
   var url = Uri.parse('http://localhost/flutterConnect_mySql/register.php');

  Future senddata() async {
	  final response = await http.post(url, body: {
	    "name": nameController.text,
	    "email": emailController.text,
	    "mobile":phoneNumberController.text,
	  });
    print(response.body);
	}
   var urlGet = Uri.parse('http://localhost/flutterConnect_mySql/getData.php');
  Future<List?> getData() async {
    var response = await http.get(urlGet);
    print('Response status: ${response.statusCode}');
    return jsonDecode(response.body);
    // print(a[0]['username']);
	}

  @override
  void initState() {
   PostApi.fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
	      appBar: AppBar(title: Text("Register"),),
	      body: FutureBuilder(
          future: PostApi.fetchData(), 
          builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot){
          // builder: (context, AsyncSnapshot snapshot) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemCount: snapshot.data?.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.center,
                    child: Stack(children: [
                     Column(
                       children: [
                          Container(
                        child:Text('${snapshot.data![index].id}'),
                      ),
                      Container(
                        child:Text('${snapshot.data![index].title}'),
                      )
                       ],
                     )
                    ]),
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(15)
                    ),
                  );
                },
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: ()async{
            //  var p = PostApi();
              List<Post> data = await PostApi.fetchData();
              data.forEach((e) {
                print("${e.userId}");
                print("${e.id}");
                print("${e.title}");
                print("${e.body}");
              });
          }
        )
	    );
  }
}
