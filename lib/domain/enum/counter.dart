enum Counter {
  increment,
  decrease,
  reset;

  bool get isIncrement => this == Counter.increment;
  bool get isDecrease => this == Counter.decrease;
  bool get isReset => this == Counter.reset;
}
