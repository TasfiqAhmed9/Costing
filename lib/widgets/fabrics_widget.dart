import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:costing/model/fabrics_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_card/image_card.dart';

class FabricsWidget extends StatelessWidget {
  const FabricsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseFirestore.instance.collection('fabrics').get(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text("Error"),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            height: Get.height / 5,
            child: Center(
              child: CupertinoActivityIndicator(),
            ),
          );
        }

        if (snapshot.data!.docs.isEmpty) {
          return Center(
            child: Text("No fabric found!"),
          );
        }

        if (snapshot.data != null) {
          return Container(
            height: Get.height / 5.0,
            child: ListView.builder(
              itemCount: snapshot.data!.docs.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                FabricsModel fabricsModel = FabricsModel(
                  fabricId: snapshot.data!.docs[index]['fabricId'],
                  fabricImg: snapshot.data!.docs[index]['fabricImg'],
                  fabricName: snapshot.data!.docs[index]['fabricName'],
                  createdAt: snapshot.data!.docs[index]['createdAt'],
                  updatedAt: snapshot.data!.docs[index]['updatedAt'],
                );
                return Row(
                  children: [
                    GestureDetector(
                      // onTap: () => Get.to(() => AllSingleCategoryProductsScreen(
                      //     categoryId: fabricsModel.fabricId)),
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: FillImageCard(
                          borderRadius: 20.0,
                          width: Get.width / 3.0,
                          heightImage: Get.height / 13,
                          imageProvider: CachedNetworkImageProvider(
                            fabricsModel.fabricImg,
                          ),
                          title: Column(
                            children: [
                              Center(
                                child: Text(
                                  fabricsModel.fabricName,
                                  style: TextStyle(fontSize: 12.0),
                                ),
                              ),
                              Text(
                                'price: 10/kg',
                                // 'Rs : ${product.price ?? ''}',
                                style: TextStyle(
                                    // fontSize: 20,
                                    // fontWeight: FontWeight.bold,
                                    color: Colors.green),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        }

        return Container();
      },
    );
  }
}
