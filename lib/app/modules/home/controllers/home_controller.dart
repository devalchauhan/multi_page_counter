import 'dart:async';

import 'package:counter_app/app/data/counter/counter_dao.dart';
import 'package:counter_app/app/data/counter/model/counter.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final CounterDao counterDao;
  final selectedPage = 0.obs;
  final counterOne = 0.obs;
  final counterTwo = 0.obs;
  final counterThree = 0.obs;
  late StreamSubscription<DatabaseEvent> _counterSubscription;

  HomeController(this.counterDao);

  @override
  void onInit() {
    super.onInit();
    _counterSubscription = counterDao.counterRef.onValue.listen(
      (DatabaseEvent event) {
        print(event.snapshot.value);
        // counterOne.value = (event.snapshot.value ?? 0) as int;
      },
    );
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void increment() => counterDao.saveCount(Counter(getCounter() + 1), selectedPage.string);

  void onItemTapped(int index) {
    selectedPage.value = index;
  }

  int getCounter() {
    switch (selectedPage.value) {
      case 0:
        return counterOne.value;
      case 1:
        return counterTwo.value;
      case 2:
        return counterThree.value;
      default:
        return 0;
    }
  }
}
