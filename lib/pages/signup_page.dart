import 'package:costing/controller/google_signin_controller.dart';
import 'package:costing/controller/sign_up_controller.dart';
import 'package:costing/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
// import 'package:g_calculation/pages/login_page.dart';
// import 'package:google_sign_in/google_sign_in.dart';

class SignupPage extends StatefulWidget {
  SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
  // _PasswordFieldState createState() => _PasswordFieldState();
}

// GetBuilder<HomeController>(builder: (ctrl)
class _SignupPageState extends State<SignupPage> {
  final SignUpController signUpController = Get.put(SignUpController());
  TextEditingController username = TextEditingController();
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPhone = TextEditingController();
  TextEditingController userPassword = TextEditingController();

  final GoogleSigninController _googleSigninController =
      Get.put(GoogleSigninController());
  // final GoogleSignIn _googleSignIn = GoogleSignIn();
  // Google Sign-In
  // Future<void> _signInWithGoogle() async {
  //   try {
  //     final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
  //     if (googleUser != null) {
  //       // Handle the Google sign-in and authentication
  //       print("Google User: ${googleUser.displayName}");
  //     }
  //   } catch (error) {
  //     print("Google Sign-In Error: $error");
  //   }
  // }

  // Facebook Sign-In
  // Future<void> _signInWithFacebook() async {
  //   try {
  //     final LoginResult result = await FacebookAuth.i.login();
  //     if (result.status == LoginStatus.success) {
  //       final userData = await FacebookAuth.i.getUserData();
  //       print("Facebook User: ${userData['name']}");
  //     } else {
  //       print("Facebook Sign-In Error: ${result.status}");
  //     }
  //   } catch (error) {
  //     print("Facebook Sign-In Error: $error");
  //   }
  // }

  bool _isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
        return Scaffold(
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.all(20),
              // decoration: BoxDecoration(color: Colors.blueGrey),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Create New Account',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: username,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        prefixIcon: Icon(Icons.person_rounded),
                        labelText: 'Your Name',
                        hintText: 'Enter your Name'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: userPhone,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        prefixIcon: Icon(Icons.add_ic_call_rounded),
                        labelText: 'Mobile Number',
                        hintText: 'Enter your Mobile number'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: userEmail,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        prefixIcon: Icon(Icons.email),
                        labelText: 'Your E-mail',
                        hintText: 'Enter your e-mail'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: userPassword,
                    // controller: ctrl.loginNumberController,
                    obscureText:
                        !_isPasswordVisible, // Show or hide password based on the boolean value
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      prefixIcon: Icon(Icons.lock),
                      labelText: 'Password',
                      hintText: 'Enter password',
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible =
                                !_isPasswordVisible; // Toggle visibility
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      String name = username.text.trim();
                      String phone = userPhone.text.trim();
                      String email = userEmail.text.trim();
                      String password = userPassword.text.trim();
                      String? userDeviceToken = '';
                      if (name.isEmpty ||
                          phone.isEmpty ||
                          email.isEmpty ||
                          password.isEmpty) {
                        Get.snackbar(
                          "Error",
                          "Please enter all details",
                          snackPosition: SnackPosition.BOTTOM,colorText: Colors.red
                        );
                      } else {
                        UserCredential? userCredential =
                            await signUpController.signUpMethod(
                                name, email, phone, password, userDeviceToken);

                        if (userCredential != null) {
                          Get.snackbar(
                            "Verification email sent.",
                            "Please check your email.",
                            snackPosition: SnackPosition.BOTTOM,colorText: Colors.green
                            // backgroundColor: AppConstant.appScendoryColor,
                            // colorText: AppConstant.appTextColor,
                          );

                          FirebaseAuth.instance.signOut();
                          Get.offAll(() => LoginPage());
                        }
                      }

                      // else {
                      //   UserCredential? UserCredential =
                      //       await signUpController.signUpMethod(
                      //     name,
                      //     email,
                      //     phone,
                      //     password,
                      //   );
                      //   if (UserCredential != null) {
                      //     Get.snackbar(
                      //       "Error",
                      //       "Please enter all details",
                      //       snackPosition: SnackPosition.BOTTOM,
                      //     );
                      //     FirebaseAuth.instance.signOut();
                      //     Get.offAll(() => LoginPage());
                      //   }
                      // }
                    },
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.deepPurple),
                    child: Text('Sign Up'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // _signInWithFacebook();
                          },
                          child: CircleAvatar(
                            backgroundImage: AssetImage('assets/logo/fab.jpeg'),
                            radius: 25,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),

                        GestureDetector(
                          onTap: () {
                            _googleSigninController.signInWithGoogle();
                            // _signInWithGoogle();
                          },
                          child: CircleAvatar(
                            backgroundImage: AssetImage('assets/logo/goo.png'),
                            radius: 25,
                          ),
                        ),
                        // ElevatedButton(
                        //   onPressed: _signInWithGoogle,
                        //   child: Text('Sign in with Google'),
                        // ),
                        // SizedBox(height: 20),
                        // ElevatedButton(
                        //   onPressed: _signInWithFacebook,
                        //   child: Text('Sign in with Facebook'),
                        // ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an Account? ",
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => LoginPage()));
                        },
                        child: Text(
                          "Sign in",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.red),
                        ),
                      )

                      // TextButton(
                      //   onPressed: () {
                      //     Navigator.of(context).push(
                      //       MaterialPageRoute(
                      //         builder: (context) => LoginPage(),
                      //       ),
                      //     );
                      //   },
                      //   child: Text('Login'),
                      // ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      });
    });
  }
}
