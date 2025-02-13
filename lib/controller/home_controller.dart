// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:costing/model/product/product.dart';
// import 'package:flutter/material.dart';
// // import 'package:costing/model/product/product.dart';
// import 'package:get/get.dart';

// class HomeController extends GetxController {
//   FirebaseFirestore firestore = FirebaseFirestore.instance;
//   late CollectionReference productCollection;

//   List<Product> products = [];
//   List<Product> productShowUi = [];

//   @override
//   Future<void> onInit() async {
//     productCollection = firestore.collection('products');
//     await fetchProducts();
//     super.onInit();
//   }


//   fetchProducts() async {
//     try {
//       QuerySnapshot productSnapshot = await productCollection.get();
//       final List<Product> retrievedProducts = productSnapshot.docs
//           .map((doc) => Product.fromJson(doc.data() as Map<String, dynamic>))
//           .toList();
//       products.clear();
//       products.assignAll(retrievedProducts);
//       productShowUi.assignAll(products);
//       Get.snackbar('Success', 'Product fetch successfully',
//           colorText: Colors.green);
//     } catch (e) {
//       Get.snackbar('Error', e.toString(), colorText: Colors.red);
//       print(e);
//     }
//   }

//   // addProduct() {
//   //   DocumentReference doc = productCollection.doc();
//   //   Product product = Product(
//   //       id: doc.id,
//   //       name: 'test name from flutter',
//   //       accessories: 'a',
//   //       aop: 'a',
//   //       buyinghouse_commision: 1,
//   //       category_mid: 'cd',
//   //       category_top: 'ab',
//   //       description: 'a',
//   //       embrodery: 'a',
//   //       image: 'ab',
//   //       print: 'ab',
//   //       quantity: 1,
//   //       rmg_cost: 1,
//   //       shipping_cost: 1,
//   //       size: 'ab',
//   //       special_cost: 1,
//   //       wash: 'a');
//   // }

//   // final productJson = Product.toJson();
//   // doc.set(productJson);
// }
