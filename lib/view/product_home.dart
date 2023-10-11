import 'package:apiintegration_http/controller/product_controller.dart';
import 'package:apiintegration_http/view/widgets/productTile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Producthome extends StatelessWidget {
  final Productcontroller productcontroller = Get.put(Productcontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Obx(() {
          if (productcontroller.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return GridView.builder(
              itemCount: productcontroller.productList.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                return ProductTile(
                    product: productcontroller.productList[index]);
              },
            );
          }
        }),
      ),
    );
  }
}
