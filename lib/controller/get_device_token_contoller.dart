import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetDeviceTokenContoller extends GetxController {
  String? deviceToken;
  @override
  void onInit() {
    // TODO: implement $configureLifeCycle
    super.onInit();
    getDeviceToken();
  }

  Future<void> getDeviceToken() async {
    try {
      String? token = await FirebaseMessaging.instance.getToken();
      if (token != null) {
        deviceToken = token;
        print("token:$deviceToken");
        update();
      }
    } catch (e) {
      Get.snackbar("Error", "$e",
          snackPosition: SnackPosition.BOTTOM, colorText: Colors.red
          // backgroundColor: AppConstant.appScendoryColor,
          // colorText: AppConstant.appTextColor,
          );
    }
  }
}
