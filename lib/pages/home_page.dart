// import 'package:costing/controller/home_controller.dart';
import 'package:costing/pages/dami_productdescription_page.dart';
// import 'package:costing/pages/product_description_page.dart';
import 'package:costing/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:get/get.dart';
// import 'package:multiselect_dropdown_flutter/multiselect_dropdown_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // return GetBuilder<HomeController>(builder: (ctrl) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Garments Costing",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              GoogleSignIn googleSignIn = GoogleSignIn();
              await googleSignIn.signOut();
              Get.offAll(() => HomePage());
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 51,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    // ctrl.filterByCategory(
                    //     ctrl.productCategory[index].name ?? '');
                  },
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Chip(
                      label: Text('category'
                          // ctrl.productCategory[index].name ?? 'Error',
                          // style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                    ),
                  ),
                );
              },
              itemCount: 10,
              // ctrl.productCategory.length,
            ),
          ),
          // Row(
          //   children: [
          //     Flexible(
          //       child: DropdownBtn(
          //         items: ['Rs: Low to High', 'Rs: High to Low'],
          //         selectedItemText: 'Sort',
          //         onSelected: (selected) {
          //           // print(selected);
          //           ctrl.sortByPrice(
          //               ascending:
          //                   selected == 'Rs: Low to High' ? true : false);
          //         },
          //       ),
          //     ),
          //     Flexible(
          //       child: Card(
          //         child: MultiSelectDropdown(
          //           items: ['tat', 'item2', 'item3'],
          //           onSelectionChanged: (selectedItems) {
          //             ctrl.filterByBrand(selectedItems);
          //           },
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.8,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8),
                itemCount: 10,
                // ctrl.productShowUi.length,
                itemBuilder: (context, index) {
                  return ProductCard(
                    imageUrl:
                        "https://scontent.fdac11-2.fna.fbcdn.net/v/t39.30808-6/294481976_417677543710367_8017919241794941957_n.jpg?stp=dst-jpg_s960x960_tt6&_nc_cat=105&ccb=1-7&_nc_sid=cc71e4&_nc_ohc=qpBiul3yTncQ7kNvgEDnfYu&_nc_zt=23&_nc_ht=scontent.fdac11-2.fna&_nc_gid=AaAXohX-3tInL37e6gkTmYr&oh=00_AYBuBVg2F-wUGD-kHFYiShe80FO8vHtW0mSTk78kkNihIw&oe=67A7D276",
                    // ctrl.productShowUi[index].image ?? 'Url',
                    name: "Product Name",
                    // ctrl.productShowUi[index].name ?? 'No name',
                    price: 12,
                    // ctrl.productShowUi[index].price ?? 00,
                    // offerTag: '25 % off',
                    Ontap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DamiProductdescriptionPage()));
                      // Get.to(ProductDescriptionPage(),
                      // arguments: {'data': ctrl.productShowUi[index]});
                    },
                  );
                }),
          ),
        ],
      ),
    );
    // });
  }
}
