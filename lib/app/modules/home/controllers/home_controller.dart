import 'dart:async';
import 'dart:convert';

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
        setCounterData(event.snapshot.value);
      },
    );
  }

  void setCounterData(Object? data) {
    if (data != null) {
      var counters = data as List;
      for (var i = 0; i < counters.length; i++) {
        var counter = Map<String, dynamic>.from(counters[i]);
        var count = Counter.fromJson(counter).count;
        switch (i) {
          case 0:
            counterOne.value = count;
            break;
          case 1:
            counterTwo.value = count;
            break;
          case 2:
            counterThree.value = count;
            break;
        }
      }
    } else {
      counterDao.resetCounters();
    }
  }

  @override
  void onClose() {
    _counterSubscription.cancel();
  }

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

  void resetData() {
    counterDao.resetCounters();
  }
}
