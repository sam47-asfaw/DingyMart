import 'package:dingy_mart/ui/widgets/common_snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';



class UserDAO {
    final FirebaseAuth _auth = FirebaseAuth.instance;

    UserDAO(_auth);
    //State persistence
    Stream<User?> get authState => _auth.authStateChanges();


    bool isLoggedIn(){
      return _auth.currentUser != null;
    }

    String? userId(){
      return _auth.currentUser?.uid;
    }

    String? email(){
      return _auth.currentUser!.email;
    }

    //Email and password sign up

    Future<User?> signUpWithEmail({
      required String email,
      required String password,
      required BuildContext context,
        }) async{
      try {
        UserCredential userCredential = await _auth
            .createUserWithEmailAndPassword(
            email: email,
            password: password
        );
        return userCredential.user;
      } on FirebaseAuthException catch(e){
        showSnackBar(context, e.message.toString());

      } catch(e){
        print(e);
      }
      return null;
    }

    //Sign in with email
    signInWithEmail({
      required String email,
          required String password,
          required BuildContext context,
        }) async{
      try{
        await _auth.signInWithEmailAndPassword(
            email: email,
            password: password
        );
      } on FirebaseAuthException catch(e){
        showSnackBar(context, e.message.toString());
      } catch(e){
        print(e);
      }
    }

   //Sign out
 Future<void> signOut(BuildContext context) async{
      try{
        await _auth.signOut();

      } on FirebaseAuthException catch(e){
        showSnackBar(context, e.message!);
      }
 }


}