import 'package:flutter/material.dart';

class ProductDescriptionPage extends StatelessWidget {
  const ProductDescriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final String selectedItemText;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Product Details',
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
              child: Image.network(
                'https://png.pngtree.com/element_our/sm/20180515/sm_5afaf0c36298b.jpg',
                // product.image ?? '',
                fit: BoxFit.contain,
                width: double.infinity,
                height: 300,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'name',
              // product.name ?? '',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              'description',
              // product.description ?? '',
              style: TextStyle(fontSize: 20, height: 1.9),
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              'price: 10/kg',
              // 'Rs : ${product.price ?? ''}',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            SizedBox(
              height: 2,
            ),
            TextField(
              // controller: ctrl.addressController,
              maxLines: 3,
              decoration: InputDecoration(
                labelText: 'Billing Address',
                hintText: 'Enter Your Billing Address',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
              ),
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
