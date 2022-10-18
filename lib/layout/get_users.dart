import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:usersfakeapi/models/users_model.dart';


Future<List<UsersModel>> getAllUsers() async {
 //business logic to send data to server
 final response = await http.get(Uri.https('jsonplaceholder.typicode.com','users'));
 var jsonData = json.decode(response.body);
 List<UsersModel> users = [];
 for (var u in jsonData){
  UsersModel user = UsersModel(
   name : u['name'],
   userName : u['userName'],
   email : u['email'],
  );
  users.add(user);
 }
 return users;

  // if (usersPost == 200){
  //    return UsersModel.fromJson(jsonDecode(usersPost.body));
  // }else{
  //  throw Exception(' can\'t load Users ');
  // }
}

