import 'package:counter_app/app/data/counter/model/counter.dart';
import 'package:firebase_database/firebase_database.dart';

class CounterDao {
  final DatabaseReference counterRef = FirebaseDatabase.instance.ref('counter');

  void saveCount(Counter counter, String page) {
    counterRef.child(page).set(counter.toJson());
  }
  void resetCounters() {
    counterRef.child("0").set(Counter(0).toJson());
    counterRef.child("1").set(Counter(0).toJson());
    counterRef.child("2").set(Counter(0).toJson());
  }
}
