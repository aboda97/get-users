class UsersModel {

  final String name, userName, email;

  UsersModel({required this.name, required this.userName, required this.email});

  factory UsersModel.fromJson(Map<String, dynamic> json){
    return UsersModel(
      name : json['name'],
      userName : json['userName'],
      email : json['email'],
    );
  }
}