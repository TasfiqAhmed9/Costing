import 'package:costing/pages/home_page.dart';
// import 'package:costing/pages/product_description_page.dart';
import 'package:flutter/material.dart';
// import 'package:g_calculation/pages/home_page.dart';
// import 'package:g_calculation/pages/product_description_page.dart';
// import 'package:g_calculation/pages/product_description_page.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text("Garments Costing"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
                    },
                    child: Text("Knit Fabric"),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Woven Fabric"),
                  ),

                  // ElevatedButton(
                  //     onPressed: () {
                  //       Navigator.of(context).push(
                  //         MaterialPageRoute(
                  //           builder: (context) => ProductDescriptionPage(),
                  //         ),
                  //       );
                  //     },
                  //     child: Text("descr"),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// buildscript {
//     ext.kotlin_version = '1.7.10'
//     repositories {
//         google()
//         mavenCentral()
//     }

//     dependencies {
//         classpath "org.jetbrains.kotlin:kotlin-gradle-plugin:$kotlin_version"
//         classpath'com.google.gms:google-services:4.3.15'
//     }

// }
