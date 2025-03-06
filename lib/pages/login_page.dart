import 'package:costing/controller/get_user_data_controller.dart';
import 'package:costing/controller/sign_in_controller.dart';
import 'package:costing/pages/forget_password.dart';
import 'package:costing/pages/signup_page.dart';
import 'package:costing/pages/start_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final SignInController signInController = Get.put(SignInController());
  final GetUserDataController getUserDataController =
      Get.put(GetUserDataController());
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPassword = TextEditingController();
  bool _isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Welcome',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple),
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.green,
                  radius: 60,
                  child: CircleAvatar(
                    backgroundColor: Colors.greenAccent[100],
                    radius: 55,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/logo/pak.jpeg'),
                      radius: 100,
                      //   NetworkImage(
                      //       'https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D'
                      //       // "https://pbs.twimg.com/profile_images/1304985167476523008/QNHrwL2q_400x400.jpg"
                      //       ), //NetworkImage
                      //   radius: 100,
                    ), //CircleAvatar
                  ), //CircleAvatar
                ),
                // SizedBox(
                //   height: 200,
                // ),
                SizedBox(
                  height: 100,
                ),
                TextField(
                  controller: userEmail,
                  // controller: ctrl.loginNumberController,
                  // keyboardType: TextInputType.phone,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      prefixIcon: Icon(Icons.email_outlined),
                      labelText: 'E-mail',
                      hintText: 'Enter your e-mail address'),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: userPassword,
                  // controller: ctrl.loginNumberController,
                  obscureText:
                      !_isPasswordVisible, // Show or hide password based on the boolean value
                  keyboardType: TextInputType.visiblePassword,
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
                // SizedBox(
                //   height: 25,
                // ),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.0),
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => ForgetPassword());
                    },
                    child: Text(
                      "Forget Password?",
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.deepPurple),
                  child: Text('Login'),
                  onPressed: () async {
                    String email = userEmail.text.trim();
                    String password = userPassword.text.trim();

                    if (email.isEmpty || password.isEmpty) {
                      Get.snackbar(
                        "Error",
                        "Please enter all details",
                        snackPosition: SnackPosition.BOTTOM,
                        // backgroundColor: AppConstant.appScendoryColor,
                        // colorText: AppConstant.appTextColor,
                      );
                    } else {
                      UserCredential? userCredential =
                          await signInController.signInMethod(email, password);

                      var userData = await getUserDataController
                          .getUserData(userCredential!.user!.uid);

                      if (userCredential != null) {
                        if (userCredential.user!.emailVerified) {
                          //
                          if (userData == true) {
                            Get.snackbar(
                              "Success Login",
                              "login Successfully!",
                              snackPosition: SnackPosition.BOTTOM,
                              // backgroundColor: AppConstant.appScendoryColor,
                              // colorText: AppConstant.appTextColor,
                            );
                            Get.offAll(() => StartPage());
                          } else {
                            Get.offAll(() => StartPage());
                            Get.snackbar(
                              "Success User Login",
                              "login Successfully!",
                              snackPosition: SnackPosition.BOTTOM,
                              // backgroundColor: AppConstant.appScendoryColor,
                              // colorText: AppConstant.appTextColor,
                            );
                          }
                        } else {
                          Get.snackbar(
                            "Error",
                            "Please verify your email before login",
                            snackPosition: SnackPosition.BOTTOM,
                            // backgroundColor: AppConstant.appScendoryColor,
                            // colorText: AppConstant.appTextColor,
                          );
                        }
                      } else {
                        Get.snackbar(
                          "Error",
                          "Please try again",
                          snackPosition: SnackPosition.BOTTOM,
                          // backgroundColor: AppConstant.appScendoryColor,
                          // colorText: AppConstant.appTextColor,
                        );
                      }
                    }
                  },
                  // onPressed: () async {
                  //     String email = userEmail.text.trim();
                  //     String password = userPassword.text.trim();

                  //     if (email.isEmpty || password.isEmpty) {
                  //       Get.snackbar(
                  //         "Error",
                  //         "Please enter all details",
                  //         snackPosition: SnackPosition.BOTTOM,
                  //         // backgroundColor: AppConstant.appScendoryColor,
                  //         // colorText: AppConstant.appTextColor,
                  //       );
                  //     } else {
                  //       UserCredential? userCredential = await signInController
                  //           .signInMethod(email, password);

                  // var userData = await getUserDataController
                  //     .getUserData(userCredential!.user!.uid);

                  //       if (userCredential != null) {
                  //         if (userCredential.user!.emailVerified) {
                  //           //
                  //           if (userData[0]['isAdmin'] == true) {
                  //             Get.snackbar(
                  //               "Success Admin Login",
                  //               "login Successfully!",
                  //               snackPosition: SnackPosition.BOTTOM,
                  //               // backgroundColor: AppConstant.appScendoryColor,
                  //               // colorText: AppConstant.appTextColor,
                  //             );
                  //             Get.offAll(() => AdminMainScreen());
                  //           } else {
                  //             Get.offAll(() => MainScreen());
                  //             Get.snackbar(
                  //               "Success User Login",
                  //               "login Successfully!",
                  //               snackPosition: SnackPosition.BOTTOM,
                  //               backgroundColor: AppConstant.appScendoryColor,
                  //               colorText: AppConstant.appTextColor,
                  //             );
                  //           }
                  //         } else {
                  //           Get.snackbar(
                  //             "Error",
                  //             "Please verify your email before login",
                  //             snackPosition: SnackPosition.BOTTOM,
                  //             backgroundColor: AppConstant.appScendoryColor,
                  //             colorText: AppConstant.appTextColor,
                  //           );
                  //         }
                  //       } else {
                  //         Get.snackbar(
                  //           "Error",
                  //           "Please try again",
                  //           snackPosition: SnackPosition.BOTTOM,
                  //           backgroundColor: AppConstant.appScendoryColor,
                  //           colorText: AppConstant.appTextColor,
                  //         );
                  //       }
                  //     }
                  //   },

                  //   onPressed: () async {
                  //     Get.offAll(() => StartPage());
                  //     String email = userEmail.text.trim();
                  //     String password = userPassword.text.trim();
                  //     if (email.isEmpty || password.isEmpty) {
                  //       Get.snackbar("Error", "Please enter all details");
                  //     } else {
                  //       UserCredential? userCredential = await
                  //           signInController.signInMethod(email, password);
                  //       // var userData = await getUserDataController
                  //       //     .getUserData(userCredential!.user!.uid);
                  //       // UserCredential? userCredential =
                  //       //     await signInController.signInMethod(email, password);

                  //       //     var userData = await getUserDataController
                  //       // .getUserData(userCredential!.user!.uid);

                  //       if (userCredential != null) {
                  //         if (userCredential.user!.emailVerified) {
                  //           Get.snackbar("Success", "login Successfully");
                  //         } else {
                  //           Get.snackbar(
                  //             "Error",
                  //             "Please verify your email before login",
                  //           );
                  //         }
                  //       } else {
                  //         Get.snackbar("Error", "Please try again");
                  //       }
                  //     }
                  //   },
                ),

                SizedBox(
                  height: 23,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SignupPage()));
                      },
                      child: Text(
                        "Sign up",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.red),
                      ),
                    )
                  ],
                ),

                // TextButton(
                //   onPressed: () {
                //     Navigator.of(context).push(
                //       MaterialPageRoute(builder: (context) => SignupPage()),
                //     );
                //   },
                //   child: Text('Register New Account'),
                // ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

// onPressed: () async {
//                     String email = userEmail.text.trim();
//                     String password = userPassword.text.trim();

//                     if (email.isEmpty || password.isEmpty) {
//                       Get.snackbar(
//                         "Error",
//                         "Please enter all details",
//                         snackPosition: SnackPosition.BOTTOM,
//                         // backgroundColor: AppConstant.appScendoryColor,
//                         // colorText: AppConstant.appTextColor,
//                       );
//                     } else {
//                       UserCredential? userCredential =
//                           await signInController.signInMethod(email, password);

//                       // var userData = await getUserDataController
//                       //     .getUserData(userCredential!.user!.uid);

//                       if (userCredential != null) {
//                         if (userCredential.user!.emailVerified) {
//                           //
//                           // if (userData == true) {
//                           Get.snackbar(
//                             "Success Login",
//                             "login Successfully!",
//                             snackPosition: SnackPosition.BOTTOM,
//                             // backgroundColor: AppConstant.appScendoryColor,
//                             // colorText: AppConstant.appTextColor,
//                           );
//                           Get.offAll(() => StartPage());
//                           //   Get.offAll(() => SignupPage());
//                           // } else {
//                           //   Get.offAll(() => StartPage());
//                           //   Get.snackbar(
//                           //     "Success User Login",
//                           //     "login Successfully!",
//                           //     snackPosition: SnackPosition.BOTTOM,
//                           //     // backgroundColor: AppConstant.appScendoryColor,
//                           //     // colorText: AppConstant.appTextColor,
//                           //   );
//                           // }
//                         } else {
//                           Get.snackbar(
//                             "Error",
//                             "Please verify your email before login",
//                             snackPosition: SnackPosition.BOTTOM,
//                             // backgroundColor: AppConstant.appScendoryColor,
//                             // colorText: AppConstant.appTextColor,
//                           );
//                         }
//                       } else {
//                         Get.snackbar(
//                           "Error",
//                           "Please try again",
//                           snackPosition: SnackPosition.BOTTOM,
//                           // backgroundColor: AppConstant.appScendoryColor,
//                           // colorText: AppConstant.appTextColor,
//                         );
//                       }
//                     }
