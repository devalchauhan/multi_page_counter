import 'package:counter_app/app/modules/home/views/counter_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: CounterView(),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Text(''),
              label: 'Counter 1',
            ),
            BottomNavigationBarItem(
              icon: Text(''),
              label: 'Counter 2',
            ),
            BottomNavigationBarItem(
              icon: Text(''),
              label: 'Counter 3',
            ),
          ],
          currentIndex: controller.selectedPage.value,
          selectedItemColor: Colors.amber[800],
          onTap: controller.onItemTapped,
        ),
      ),
    );
  }
}
