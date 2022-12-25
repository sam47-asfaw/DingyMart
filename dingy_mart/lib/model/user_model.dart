import 'model.dart';
class UserModel{
  String? id;
  String? email;
  String? password;
  CartModel? cart;
  WishListModel? wish;

  UserModel({
     this.id,
     this.email,
     this.password,
     this.cart,
     this.wish,
});

  String getGeneratedUserName(String email){
    String userName = email.replaceAll('@gmail.com', '\'s');
    return userName;
  }
}