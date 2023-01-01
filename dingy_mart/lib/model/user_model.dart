import 'model.dart';
class UserModel{
  String? id;
  String? email;
  String? password;
  CartModel? cart;
  WishListModel? wishList;

  UserModel({
     this.id,
     this.email,
     this.password,
    this.cart,
    this.wishList,
});

  String getGeneratedUserName(String email){
    String userName = email.replaceAll('@gmail.com', '\'s');
    return userName;
  }

  CartModel? get userCart => cart;

  WishListModel? get userWishList => wishList;

}