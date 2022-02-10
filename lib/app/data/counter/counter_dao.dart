import 'package:counter_app/app/data/counter/model/counter.dart';
import 'package:firebase_database/firebase_database.dart';

class CounterDao {
  final DatabaseReference _messagesRef = FirebaseDatabase.instance.ref('counter');

  void saveCount(Counter counter, String page) {
    _messagesRef.child(page).push().set(counter.toJson());
  }
}
