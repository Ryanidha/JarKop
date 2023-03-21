import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MenuData {
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  Future<void> getMenu(String email) async {
    try {
      QuerySnapshot querySnapshot =
          await usersCollection.where('email', isEqualTo: email).get();
      if (querySnapshot.size == 1) {
        DocumentSnapshot documentSnapshot = querySnapshot.docs.first;
        // print(documentSnapshot.data);
        // Do something with documentSnapshot
      } else {
        // User not found
      }
    } catch (e) {
      print("Error getting user: $e");
    }
  }
}
