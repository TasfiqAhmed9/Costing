import 'package:costing/widgets/drop_down_btn.dart';
import 'package:costing/widgets/multiselect_dropdown_button.dart';
import 'package:flutter/material.dart';

class DamiProductdescriptionPage extends StatelessWidget {
  const DamiProductdescriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Product Description",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset(
                "assets/logo/pak.jpeg",
                fit: BoxFit.contain,
                width: double.infinity,
                height: 300,
              ),
              // Image.network(
              //   product.image ?? '',
              // fit: BoxFit.contain,
              // width: double.infinity,
              // height: 300,
              // ),
            ),
            SizedBox(
              height: 10,
            ),

            Text("product name"),
            // Text(
            //   product.name ?? '',
            //   style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            // ),
            SizedBox(
              height: 3,
            ),

            Text("Description"),
            // Text(
            //   product.description ?? '',
            //   style: TextStyle(fontSize: 20, height: 1.9),
            // ),
            SizedBox(
              height: 3,
            ),

            Text("12"),
            // Text(
            //   'Rs : ${product.price ?? ''}',
            //   style: TextStyle(
            //       fontSize: 20,
            //       fontWeight: FontWeight.bold,
            //       color: Colors.green),
            // ),
            SizedBox(
              height: 20,
            ),

            // TextField(
            // controller: ctrl.addressController,
            //   maxLines: 3,
            //   decoration: InputDecoration(
            //     labelText: 'Billing Address',
            //     hintText: 'Enter Your Billing Address',
            //     border: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(13),
            //     ),
            //   ),
            // ),

            TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  prefixIcon: Icon(Icons.shield),
                  labelText: 'Quantity',
                  hintText: 'Enter quantity'),
            ),
            SizedBox(
              height: 20,
            ),
            MultiSelectDropdown(
                items: ['Nb to 3XL', 'XS to XXL', 'Nb to 3XL'],
                onSelectionChanged: (selectedItems) {}),

            SizedBox(
              height: 20,
            ),

            DropDownBtn(
              items: ['Basic Embrodery', 'Special Embrodery'],
              selectedItemText: 'Embrodery',
              onSelected: (selected) {
                print(selected);
                // ctrl.sortByPrice(
                //     ascending:
                //         selected == 'Rs: Low to High' ? true : false);
              },
            ),

            SizedBox(
              height: 20,
            ),

            DropDownBtn(
              items: ['Ambush Print', 'Puff Print', ' Glitter Print'],
              selectedItemText: 'Print',
              onSelected: (selected) {
                print(selected);
                // ctrl.sortByPrice(
                //     ascending:
                //         selected == 'Rs: Low to High' ? true : false);
              },
            ),

            SizedBox(
              height: 20,
            ),

            DropDownBtn(
              items: ['Garments Wash', 'Special Wash', ' Normal Wash'],
              selectedItemText: 'Wash',
              onSelected: (selected) {
                print(selected);
                // ctrl.sortByPrice(
                //     ascending:
                //         selected == 'Rs: Low to High' ? true : false);
              },
            ),

            SizedBox(
              height: 20,
            ),

            DropDownBtn(
              items: ['Pigmet Print', 'Discharge', 'Reactive'],
              selectedItemText: 'AOP',
              onSelected: (selected) {
                print(selected);
                // ctrl.sortByPrice(
                //     ascending:
                //         selected == 'Rs: Low to High' ? true : false);
              },
            ),

            SizedBox(
              height: 20,
            ),

            TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  prefixIcon: Icon(Icons.shopify_sharp),
                  labelText: 'Accessories',
                  hintText: 'Accessories Item'),
            ),
            SizedBox(
              height: 20,
            ),

            ElevatedButton(
              onPressed: () {},
              child: Text("Add"),
            ),
            SizedBox(
              height: 20,
            ),

            TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  // prefixIcon: Icon(Icons.shopify_sharp),
                  labelText: 'RMG Cost',
                  hintText: 'RMG Cost'),
            ),

            SizedBox(
              height: 20,
            ),

            TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  // prefixIcon: Icon(Icons.shopify_sharp),
                  labelText: 'Special Costing',
                  hintText: 'Special Costing'),
            ),

            SizedBox(
              height: 20,
            ),

            TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  // prefixIcon: Icon(Icons.shopify_sharp),
                  labelText: 'Shipping Cost',
                  hintText: 'Shipping Cost'),
            ),

            SizedBox(
              height: 20,
            ),

            TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  // prefixIcon: Icon(Icons.shopify_sharp),
                  labelText: 'Buying House Commision',
                  hintText: 'Buying House Commision'),
            ),

            SizedBox(
              height: 20,
            ),

            SizedBox(
              height: 20,
            ),

            SizedBox(
              height: 20,
            ),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    backgroundColor: Colors.deepPurple),
                onPressed: () {
                  // ctrl.submitOrder(
                  //     price: product.price ?? 0,
                  //     item: product.name ?? '',
                  //     description: product.description ?? '');
                },
                child: Text(
                  'Buy Now',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
