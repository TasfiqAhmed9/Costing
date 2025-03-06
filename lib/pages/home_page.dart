// import 'package:costing/controller/home_controller.dart';
import 'package:costing/pages/dami_productdescription_page.dart';
// import 'package:costing/pages/product_description_page.dart';
import 'package:costing/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:google_sign_in/google_sign_in.dart';

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
        // actions: [
        //   IconButton(
        //     onPressed: () async {
        //       GoogleSignIn googleSignIn = GoogleSignIn();
        //       await googleSignIn.signOut();
        //       Get.offAll(() => HomePage());
        //     },
        //     icon: Icon(Icons.logout),
        //   ),
        // ],
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
                        "https://media.canva.com/v2/mockup-template-rasterize/color0:171618/image0:s3%3A%2F%2Ftemplate.canva.com%2FEAFxZJHbX_A%2F1%2F0%2F933w--inuARME-hI.png/mockuptemplateid:FAqieNuus/size:L?csig=AAAAAAAAAAAAAAAAAAAAAOW_twwcDCh8BgOc9gDxt83OD2_8w42QCG-3xyTUi376&exp=1740269033&osig=AAAAAAAAAAAAAAAAAAAAANpKBrU0r4mw8icxmO6WpDqcvOTicAwOVJJlH3SWxltG&seoslug=black-and-orange-typography-never-give-up-stay-strong-t-shirt&signer=marketplace-rpc",
                    // ctrl.productShowUi[index].image ?? 'Url',
                    name: "Product Name",
                    // ctrl.productShowUi[index].name ?? 'No name',
                    price: 12,
                    // ctrl.productShowUi[index].price ?? 00,
                    // offerTag: '25 % off',
                    Ontap: () {
                      Get.to(DamiProductdescriptionPage());
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => DamiProductdescriptionPage()));
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
