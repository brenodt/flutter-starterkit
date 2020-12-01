class Counter {
  Counter({int initialValue = 0});
  int _currentValue;

  void reset() => _currentValue = 0;
  int get value => _currentValue;

  int increment() => _currentValue++;
  int decrement() => _currentValue--;
}
