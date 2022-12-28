import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io' as io;
import 'package:dingy_mart/model/model.dart';

class DingyMartDB{
  //create database instance
  static Database? _database;


  Future<Database?> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await initDatabase();
    return null;
  }

  //initialize database
  initDatabase() async {
    io.Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'dingyMart.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }


  _onCreate(Database db, int version) async {
    const primaryTextType =  'VARCHAR PRIMARY KEY';
    const textType  = 'VARCHAR';
    const uniqueTextType = 'VARCHAR UNIQUE';
    //const numType = 'INTEGER';

  //cart table
    await db.execute('''
        CREATE TABLE $cartTable(
        ${CartFields.id} $primaryTextType , 
        ${CartFields.userId} $textType,
        ${CartFields.title} $textType,
        ${CartFields.imgUrl} $textType,
        ${CartFields.price} $textType,
           )
    ''');

    //wishList table
    await db.execute('''
        CREATE TABLE $wishListTable(
        ${WishListFields.id} $primaryTextType ,
        ${WishListFields.userId} $textType,
        ${WishListFields.productId} $uniqueTextType,
        ${WishListFields.title} $textType,
         ${WishListFields.imgUrl} $textType,
           )
    ''');
  }

  // inserting data into the cart table
  Future<CartModel> insertIntoCart(String userId, String id, ProductModel product) async {
    var dbClient = await database;
     CartModel cart = dbClient!.insert(cartTable,
         CartModel(
             id:id,
             userId: userId,
             title: product.name,
              imgUrl: product.imgUrl,
              price: product.price.toString(),
         ).toJson()
     ) as CartModel;
     return cart;
  }

 // inserting data into the wish table
  Future<WishListModel> insertIntoWishList(String id, String userId, ProductModel product) async {
    var dbClient = await database;
   WishListModel wish = (await dbClient!.insert(wishListTable,
       WishListModel(
        id: id,
        userId: userId,
        productId: product.id,
         title: product.name,
         imgUrl: product.imgUrl,
   ).toJson())) as WishListModel;
    return wish;
  }

// getting all the items in the cart from the database
  Future<List<CartModel>> getCart() async {
    var dbClient = await database;
    final List<Map<String, dynamic>> queryResult = await dbClient!.query(cartTable);
    return queryResult.map(
            (data) => CartModel.fromJson(data)
    ).toList();
  }

  // getting all the items in the wishList from the database
  Future<List<WishListModel>> getWishList() async {
    var dbClient = await database;
    final List<Map<String, dynamic>> queryResult = await dbClient!.query(cartTable);
    return queryResult.map(
            (result) => WishListModel.fromJson(result)
    ).toList();
  }

// deleting an item from the cart screen
  Future<int> deleteCartItem(String id) async {
    var dbClient = await database;
    return await dbClient!.delete(cartTable, where: 'id = ?', whereArgs: [id]);
  }
  Future<int> deleteAllCartItem() async{
    var dbClient = await database;
    return await dbClient!.delete("delete from "+ cartTable);
  }

  //deleting an item from wish screen
Future<int> deleteWishListItem(String id) async{
    var dbClient = await database;
    return await dbClient!.delete(wishListTable, where: 'id = ?', whereArgs: [id]);
 }

 Future<int> deleteAllWishListItem() async{
    var dbClient = await database;
    return await dbClient!.delete("delete from "+ wishListTable);
 }

 // //get Cart id
 //  Future<List<CartModel>> getCartById(String id) async {
 //    var dbClient = await database;
 //    final List<Map<String, Object?>> queryIdResult =
 //    await dbClient!.query(cartTable, where: 'id = ?', whereArgs: [id]);
 //    return queryIdResult.map(
 //            (data) => CartModel.fromJson(data)
 //    ).toList();
 //  }
 //
 //  //get wishList Id
 //  Future<List<WishListModel>> getWishListId(String id) async {
 //    var dbClient = await database;
 //    final List<Map<String, Object?>> queryIdResult =
 //    await dbClient!.query(wishListTable, where: 'id = ?', whereArgs: [id]);
 //    return queryIdResult.map(
 //            (data) => WishListModel.fromJson(data)
 //    ).toList();
 //  }

}