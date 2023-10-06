import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Users {
  final int userId;
  final int id;
  final String title;

  const Users({
    required this.userId,
    required this.id,
    required this.title,
  });
  //api response is a string.
  //factory called when data coming from json
  //factory makes multiple objects
  //can also use toJson to send
  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}



class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  State<UserList> createState() => _UserListState();


}

class _UserListState extends State<UserList> {

  @override
  void initState() {
  super.initState();
  fetchUser();
  
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API calls'),
      ),
      body:  Center(
          child: FutureBuilder<List<Users>>(
            future: fetchUser(), //snapshot have data coming from fetchUser()
            builder: (context,snapshot) {
                if(snapshot.hasData) {
                  return ListView.builder (
                     itemCount: snapshot.data?.length,
                    itemBuilder: (context,i) {
                      var item = snapshot.data![i];
                      return Text(item.title+': '+(item.id).toString());
                  });
                  
                 } else {
                  return Text('No data');
                }
            }
          )
    ));
  }
}

//Future<List<Users>> fetchUser() async {}

// will fetch api
Future<List<Users>> fetchUser() async {
  //data will be fetched in future, so 'Future<..>..'
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));

   if(response.statusCode==200) {
    List<dynamic> _parseListJson = 
    jsonDecode(response.body);
    List<Users> _itemList = List<Users>.from(
      _parseListJson.map<Users>((dynamic i) 
      => Users.fromJson(i)));
      return _itemList;
   } else {
    throw Exception('Failed to load list');
   }
}

