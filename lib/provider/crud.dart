import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:use_of_sentiment_analysis_in_citizen_participation/model/userModel.dart';

final crudprovider = Provider(((ref) => Crud()));

class Crud {
  //function to add question data in firebasefirestore
  Future<String> uploadData({
    required String question,
  }) async {
    try {
      final id = FirebaseAuth.instance.currentUser!.uid;
      final name = FirebaseAuth.instance.currentUser!.displayName;
      final eventBased = FirebaseFirestore.instance.collection('Opinion');
      eventBased
          .doc(
        id,
      )
          .set({
        "UserId": id,
        "Name": name,
        "Question": question,
        "userComments": [{}]
      });
      return "Success";
    } catch (err) {
      throw err;
    }
  }

  Future<String> addComment(

      //uploading comment data in firebase firestore
      {String? Name,
      required String Comment,
      required String Uid,
      required String status,
      required int score}) async {
    try {
      DocumentReference documentReference =
          FirebaseFirestore.instance.collection('Opinion').doc(Uid);
      await documentReference.update({
        "userComments": FieldValue.arrayUnion([
          {
            "Comment by": Name,
            "Comment": Comment,
            "Score": score,
            "Status": status
          }
        ])
      });

      return "Success";
    } catch (err) {
      throw err.toString();
    }
  }

  Future<List<dynamic>> fetchList({required String documentId}) async {
    // Get a reference to the document
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection('Opinion').doc(documentId);

    // Get the document snapshot
    DocumentSnapshot snapshot = await documentReference.get();

    // Check if the document exists
    if (snapshot.exists) {
      // Get the list field from the document
      return snapshot['userComments'];
    } else {
      throw "err";
      // The document does not exist

    }
  }

  Future<List<dynamic>> viewUserResponse() async {
    // Get a reference to the document
    final uid = FirebaseAuth.instance.currentUser!.uid;
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection('Opinion').doc(uid);

    // Get the document snapshot
    DocumentSnapshot snapshot = await documentReference.get();

    // Check if the document exists
    if (snapshot.exists) {
      // Get the list field from the document
      return snapshot['userComments'];
    } else {
      throw "err";
      // The document does not exist

    }
  }

  Future<String> myQuestion() async {
    // Get a reference to the document
    final uid = FirebaseAuth.instance.currentUser!.uid;
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection('Opinion').doc(uid);

    // Get the document snapshot
    DocumentSnapshot snapshot = await documentReference.get();

    // Check if the document exists
    if (snapshot.exists) {
      // Get the list field from the document
      return snapshot['Question'];
    } else {
      throw "err";
      // The document does not exist

    }
  }
}
