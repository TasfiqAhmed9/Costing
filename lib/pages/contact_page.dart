import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        // titleTextStyle: TextStyle(fontWeight: FontWeight.bold),
        title: Text(
          "Contact",
          style: TextStyle(
            // fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ListTile(
              titleAlignment: ListTileTitleAlignment.center,
              title: Text(
                "phone: 012345",
                style: TextStyle(color: Colors.black),
              ),
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/logo/phone.png'),
                radius: 25.0,
              ),
              // trailing: Icon(
              //   Icons.arrow_forward,
              //   color: Colors.black,
              // ),
              onTap: () {
                // Get.back();
                // Get.to(() => AllOrdersScreen());
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ListTile(
              titleAlignment: ListTileTitleAlignment.center,
              title: Text(
                "email: abc@gmail.com",
                style: TextStyle(color: Colors.black),
              ),
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/logo/email.png'),
                radius: 25.0,
              ),
              // trailing: Icon(
              //   Icons.arrow_forward,
              //   color: Colors.black,
              // ),
              onTap: () {
                // Get.back();
                // Get.to(() => AllOrdersScreen());
              },
            ),
          ),
          // ElevatedButton(
          //   onPressed: () {},
          //   child: Container(
          //     padding: EdgeInsets.only(left: 10),
          //     height: 143,
          //     width: double.infinity,
          //     child: ListView.builder(
          //       scrollDirection: Axis.horizontal,
          //       itemCount: 5,
          //       itemBuilder: (context, index) {
          //         return InkWell(
          //           onTap: () {},
          //           // child: BannerCard(),
          //         );
          //       },
          //     ),
          //   ),
          // ),
          // SizedBox(
          //   height: 20,
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ListTile(
              titleAlignment: ListTileTitleAlignment.center,
              title: Text(
                "Whatsapp",
                style: TextStyle(color: Colors.black),
              ),
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/logo/wap.png'),
                radius: 25.0,
              ),
              // Icon(
              //   Icons.whatshot_sharp,
              //   color: Colors.black,
              // ),
              // trailing: Icon(
              //   Icons.arrow_forward,
              //   color: Colors.black,
              // ),
              onTap: () async {
                String contactNumber = '+8801608884331';
                if (Platform.isAndroid) {
                  String url =
                      'whatsapp://send?phone="$contactNumber"&text="Hello,I need help"';
                  await launchUrl(Uri.parse(url));
                } else {
                  String url =
                      'https://wa.me/"$contactNumber"?text=${Uri.parse('Hello,I need help')}';
                  await launchUrl(Uri.parse(url));
                }
                // Get.back();
                // Get.to(() => AllOrdersScreen());
              },
            ),
          ),
        ],
      ),
    );
  }
}
