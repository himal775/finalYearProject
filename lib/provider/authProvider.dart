import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//declaring provider variable
final authprovider = Provider((ref) => AuthProvider());

class AuthProvider {
  //future function for user authentication using firebase

  Future<String> userlogin(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return "Successful";
    } on AsyncLoading {
      return "Loading..";
    } on FirebaseAuthException catch (error) {
      return "$error";
    }
  }

  Future<String> userSignup(

//future function for user signup using firebase authentication
      String fullName,
      String email,
      String password) async {
    try {
      final response = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      await response.user!.updateDisplayName(fullName);

      return "Success";
    } on FirebaseAuthException catch (error) {
      return "$error";
    }
  }
}
