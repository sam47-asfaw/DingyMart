
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';


class UserDAO {

    FirebaseAuth auth = FirebaseAuth.instance;

    bool isLoggedIn(){
      return auth.currentUser != null;
    }

    String? userId(){
      return auth.currentUser?.uid;
    }

    String? email(){
      return auth.currentUser?.email;
    }

    //Email and password sign up

    signUpWithEmail({required String email, required String password}) async{
      String message = '';
      try{
        await auth.createUserWithEmailAndPassword(
            email: email,
            password: password);
      } on FirebaseAuthException catch(e){
        switch(e.code){
          case 'email-already-in-use':
            message = 'Email already in use, Please pick another email!';
            break;
          case 'operation-not-allowed':
            message = 'Email/password accounts are not enabled';
            break;
          case 'weak-password':
            message = 'Password must be more than 5 characters';
            break;
          case 'too-many-requests':
            message = 'Too many requests, Please try again later.';
            break;
        }
        return message;

      }
      catch(e,s){
        debugPrint(e.toString()+ '$s');
        return 'Sign up failed.Please try again';
      }

    }

    //Sign in with email

    signInWithEmail({required String email, required String password}) async{
      String message = '';
      try{
        await auth.signInWithEmailAndPassword(
            email: email,
            password: password
        );
      } on FirebaseAuthException catch(e){
        switch(e.code){
          case 'invalid-email':
            message = 'Wrong email or password.';
            break;
          case 'wrong-password':
            message = 'Wrong email or password.';
            break;
          case 'user-not-found':
            message = 'No user corresponding to the given email address.';
            break;
          case 'user-disabled':
            message = 'This user has been disabled.';
            break;
          case 'too-many-requests':
            message = 'Too many attempts to sign in as this user.';
            break;
        }
        return message;
      }
      catch(e,s) {
        debugPrint(e.toString() + '$s');
        return 'Login attempt failed.Please try again';

      }


    }



    //Google account sign in
    Future<UserCredential> signInWithGoogle() async {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await googleUser
          ?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    }


}