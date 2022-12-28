import 'model.dart';
class UserModel{
  String? id;
  String? email;
  String? password;

  UserModel({
     this.id,
     this.email,
     this.password,
});

  String getGeneratedUserName(String email){
    String userName = email.replaceAll('@gmail.com', '\'s');
    return userName;
  }
}