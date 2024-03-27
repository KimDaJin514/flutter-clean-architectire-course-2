sealed class OrderType<T> {
  factory OrderType.ascending() = Ascending;
  factory OrderType.descending() = Descending;
}

class Ascending<T> implements OrderType<T> {
  Ascending();
}

class Descending<T> implements OrderType<T> {
  Descending();
}