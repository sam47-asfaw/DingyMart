import 'package:dingy_mart/ui/widgets/common_snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';


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
      return _auth.currentUser?.email;
    }

    //Email and password sign up

    signUpWithEmail({
      required String email,
      required String password,
      required BuildContext context,
        }) async{
      try{
        await _auth.createUserWithEmailAndPassword(
            email: email,
            password: password
        );
        // await sendEmailVerification(context);
      } on FirebaseAuthException catch(e){
          showSnackBar(context, e.message!);
      }
    }

    //Email Verification
    // Future<void> sendEmailVerification(BuildContext context) async{
    //   try{
    //     _auth.currentUser!.sendEmailVerification();
    //     showSnackBar(context, 'Email verification has been sent');
    //
    //   } on FirebaseAuthException catch(e){
    //     showSnackBar(context, e.message!);
    //   }
    // }

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
        // if(!_auth.currentUser!.emailVerified){
        //   await sendEmailVerification(context);
        // }
      } on FirebaseAuthException catch(e){
        showSnackBar(context, e.message!);
      }
    }

    //Google account sign in
    Future<void> signInWithGoogle(BuildContext context) async {
     try{
       final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
       final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
       if(googleAuth?.accessToken != null && googleAuth?.idToken != null){
         //create new credential
         final credential = GoogleAuthProvider.credential(
           accessToken: googleAuth?.accessToken,
           idToken: googleAuth?.idToken,
         );

         UserCredential userCredential = await _auth.signInWithCredential(credential);
       }

     } on FirebaseAuthException catch(e){
       showSnackBar(context, e.message!);
     }
    }

    //Anonymous Sign-in
 Future<void> signInAnonymously(BuildContext context) async{
      try{
        await _auth.signInAnonymously();

      } on FirebaseAuthException catch(e){
        showSnackBar(context, e.message!);
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
 //Delete account just incase
Future<void> deleteAccount(BuildContext context) async{
      try{
        await _auth.currentUser!.delete();

      } on FirebaseAuthException catch(e){
        showSnackBar(context, e.message!);
      }
}


}