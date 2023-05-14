import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_provider/utils/app_layout.dart';
import 'package:provider/provider.dart';

import '../models/data_class.dart';
import 'first_page.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = AppLayout.displayHeightWithTBar(context);
    final width = AppLayout.displayWidth(context);
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        child: Column(
          children: [
            Container(
              height: height * 0.1,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                color: Colors.grey,
                width: height * 0.007,
              ))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.shopping_cart_outlined,
                  ),
                  Text(
                    'Shopping Cart',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            SizedBox(
              height: height * 0.3,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: width * 0.03),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Consumer<DataClass>(
                    builder: (context, dataclass, child) {
                      return Text(
                        "${dataclass.productCount}",
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      );
                    },
                  ),
                  const Text(
                    "Total",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            SizedBox(
              height: height * 0.1,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (context.read<DataClass>().productCount > 0) {
                        context.read<DataClass>().decrementProductCount();
                      } else {
                        Get.snackbar(
                          "Error",
                          "Product count can't be less than 0",
                          colorText: Colors.white,
                          backgroundColor: Colors.black,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(width * 0.1, height * 0.06),
                      backgroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(width * 0.02)),
                        side: BorderSide(
                            color: Colors.black, width: width * 0.003),
                      ),
                    ),
                    child: const Icon(
                      Icons.remove,
                      color: Colors.black,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // navigate to next page with GetX
                      Get.to(
                        () => const FirstPage(),
                        transition: Transition.downToUp,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                      minimumSize: Size(width * 0.3, height * 0.06),
                      backgroundColor: Colors.black,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(width * 0.02)),
                        side: BorderSide(
                            color: Colors.black, width: width * 0.003),
                      ),
                    ),
                    child: SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(
                            Icons.skip_previous,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: width * 0.05,
                          ),
                          const Text(
                            "Prev Page",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
