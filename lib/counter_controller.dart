import 'package:flutter_meedu/meedu.dart';

class CounterController extends SimpleNotifier {
  int _counter = 0;

  void updateCounter() {
    _counter++;
    notify();
  }

  int get counter => _counter;
}
