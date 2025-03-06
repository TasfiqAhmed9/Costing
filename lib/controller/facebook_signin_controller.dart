import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:costing/controller/get_device_token_contoller.dart';
import 'package:costing/model/user_model.dart';
import 'package:costing/pages/start_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookSigninController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FacebookAuth _facebookAuth = FacebookAuth.instance;

  Future<void> signInWithFacebook() async {
    final GetDeviceTokenContoller getDeviceTokenContoller =
        Get.put(GetDeviceTokenContoller());
    try {
      // Trigger the Facebook login process
      final LoginResult loginResult = await _facebookAuth.login();

      if (loginResult.status == LoginStatus.success) {
        EasyLoading.show(status: "Please wait..");

        // Access the token after a successful login
        final String? accessToken = loginResult.accessToken!.tokenString;

        if (accessToken != null) {
          // Use the access token to sign in to Firebase
          final OAuthCredential credential =
              FacebookAuthProvider.credential(accessToken);

          final UserCredential userCredential =
              await _auth.signInWithCredential(credential);

          final User? user = userCredential.user;

          if (user != null) {
            // Create a user model and save the user's data to Firestore
            UserModel userModel = UserModel(
              uId: user.uid,
              username: user.displayName ?? '',
              email: user.email ?? '',
              phone: '',
              userImg: user.photoURL ?? '',
              userDeviceToken: getDeviceTokenContoller.deviceToken.toString(),
              country: '',
              createdOn: DateTime.now(),
            );

            await FirebaseFirestore.instance
                .collection('users')
                .doc(user.uid)
                .set(userModel.toMap());

            EasyLoading.dismiss();
            Get.offAll(() => const StartPage());
          }
        } else {
          EasyLoading.dismiss();
          print("Facebook login failed: No access token found.");
        }
      } else {
        EasyLoading.dismiss();
        print("Facebook login failed: ${loginResult.status}");
      }
    } catch (e) {
      EasyLoading.dismiss();
      print("Error during Facebook sign-in: $e");
    }
  }
}




// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:costing/controller/get_device_token_contoller.dart';
// import 'package:costing/model/user_model.dart';
// import 'package:costing/pages/start_page.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// import 'package:get/get.dart';
// import 'package:facebook_auth/facebook_auth.dart';

// class FacebookSigninController extends GetxController {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FacebookAuth _facebookAuth = FacebookAuth.instance;

//   Future<void> signInWithFacebook() async {
//     final GetDeviceTokenContoller getDeviceTokenContoller =
//         Get.put(GetDeviceTokenContoller());
//     try {
//       final LoginResult loginResult = await _facebookAuth.login();

//       if (loginResult.status == LoginStatus.success) {
//         EasyLoading.show(status: "Please wait..");

//         final OAuthCredential credential =
//             FacebookAuthProvider.credential(loginResult.accessToken!.token);

//         final UserCredential userCredential =
//             await _auth.signInWithCredential(credential);

//         final User? user = userCredential.user;

//         if (user != null) {
//           // Create user model
//           UserModel userModel = UserModel(
//             uId: user.uid,
//             username: user.displayName ?? '',
//             email: user.email ?? '',
//             phone: '',
//             userImg: user.photoURL ?? '',
//             userDeviceToken: getDeviceTokenContoller.deviceToken.toString(),
//             country: '',
//             createdOn: DateTime.now(),
//           );

//           // Save user data to Firestore
//           await FirebaseFirestore.instance
//               .collection('users')
//               .doc(user.uid)
//               .set(userModel.toMap());

//           EasyLoading.dismiss();
//           Get.offAll(() => const StartPage());
//         }
//       } else {
//         EasyLoading.dismiss();
//         print("Facebook login failed: ${loginResult.status}");
//       }
//     } catch (e) {
//       EasyLoading.dismiss();
//       print("Error during Facebook sign-in: $e");
//     }
//   }
// }




// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:costing/controller/get_device_token_contoller.dart';
// import 'package:costing/model/user_model.dart';
// import 'package:costing/pages/start_page.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:get/get.dart';

// class FacebookSigninController extends GetxController {
//   final FacebookSignIn facebookSignin = FacebookSignIn();
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   Future<void> signInWithFacebook() async {
//     final GetDeviceTokenContoller getDeviceTokenContoller =
//         Get.put(GetDeviceTokenContoller());
//     try {
//       final FacebookSignInAccount? facebookSignInAccount =
//           await facebookSignin.signIn();

//       if (facebookSignInAccount != null) {
//         EasyLoading.show(status: "Please wait..");
//         // final FacebookSignInAuthentication facebookSignInAuthentication =
//         //     await facebookSignInAccount.authentication;

//         // final AuthCredential credential = FacebookAuthProvider.credential(
//         //   accessToken: facebookSignInAuthentication.accessToken,
//         //   idToken: facebookSignInAuthentication.idToken,
//         // );

//         final UserCredential userCredential =
//             await _auth.signInWithCredential(credential);

//         final User? user = userCredential.user;

//         if (user != null) {
//           // User user = user();
//           UserModel userModel = UserModel(
//             uId: user.uid,
//             username: user.displayName.toString(),
//             email: user.email.toString(),
//             phone: '',
//             // user.phoneNumber.toString(),
//             userImg: '',
//             // user.photoURL.toString(),
//             // userDeviceToken: '',
//             userDeviceToken: getDeviceTokenContoller.deviceToken.toString(),
//             country: '',
//             createdOn: DateTime.now(),
//           );

//           await FirebaseFirestore.instance
//               .collection('users')
//               .doc(user.uid)
//               .set(userModel.toMap());
//           EasyLoading.dismiss();
//           Get.offAll(() => const StartPage());
//         }
//       }
//     } catch (e) {
//       EasyLoading.dismiss();
//       print("error $e");
//     }
//   }
// }
