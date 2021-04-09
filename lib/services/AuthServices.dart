import 'package:auxie_app/services/UserServices.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import '../extensions/FirebaseUserExtension.dart';
import '../models/User.dart';

class AuthServices {
  static auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;

  static Future signInAnonymous() async {
    try {
      auth.UserCredential result = await _auth.signInAnonymously();
      auth.User user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  static Future<User> signUp(String userName, String email, String phoneNumber,
      String password) async {
    try {
      auth.UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password); //creat auth account

      User firebaseUser = result.user.convertToUser(
          name: userName,
          phoneNumber:
              phoneNumber); //firebaseUser extension for inserting signup data into user model

      await UserServices.updateUser(firebaseUser);
      /*
           call the updateUser function from UserServices to 
           insert or update data to user's collection 
           */
      return firebaseUser;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  static Future<SignInSignUpResult> signIn(
      String email, String password) async {
    try {
      auth.UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password); // sign in with your account
      User firebaseUser = await result.user.fromFireStore();
      /* 
        firbaseUser extension to get the user data
      */
      return SignInSignUpResult(user: firebaseUser);
    } catch (e) {
      print(e.toString());
      return SignInSignUpResult(message: e.toString().split(',')[1]);
    }
  }

  static Future<void> signOut() async {
    _auth.signOut();
  }

  static Stream<auth.User> get firbaseUserStream => _auth.authStateChanges();
}

class SignInSignUpResult {
  final User user;
  final String message;

  SignInSignUpResult({this.message, this.user});
}
