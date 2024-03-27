import 'package:note_app/domain/util/order_type.dart';

sealed class NoteOrder<T> {
  factory NoteOrder.title(OrderType orderType) = NoteOrderTitle;
  factory NoteOrder.date(OrderType orderType) = NoteOrderDate;
  factory NoteOrder.color(OrderType orderType) = NoteOrderColor;
}

class NoteOrderTitle<T> implements NoteOrder<T> {
  final OrderType orderType;
  NoteOrderTitle(this.orderType);
}

class NoteOrderDate<T> implements NoteOrder<T> {
  final OrderType orderType;
  NoteOrderDate(this.orderType);
}

class NoteOrderColor<T> implements NoteOrder<T> {
  final OrderType orderType;
  NoteOrderColor(this.orderType);
}