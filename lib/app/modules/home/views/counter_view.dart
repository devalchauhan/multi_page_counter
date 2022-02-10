import 'package:counter_app/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CounterView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Counter page ${controller.selectedPage.value + 1}',
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(height: 30.0,),
            Center(
              child: Text(
                '${controller.getCounter()}',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
