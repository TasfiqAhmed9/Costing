// import 'dart:js_interop';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:costing/model/user_model.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';

// class UserProfileEditController extends GetxController {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   Future<UserCredential?> updateUserRecord(UserModel user) async {
//     FirebaseFirestore.instance
//         .collection('users')
//         .doc(user.uid)
//         .update(user.toJSBox());
//     return userData.docs;
//   }
// }
