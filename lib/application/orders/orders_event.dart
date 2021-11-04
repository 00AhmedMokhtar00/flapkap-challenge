part of 'orders_bloc.dart';

abstract class OrdersEvent {}

class OrdersStartedEvent extends OrdersEvent {
  OrdersStartedEvent();
}

class OrdersGraphStarted extends OrdersEvent{
  final List<Order> orders;

  OrdersGraphStarted(this.orders);
}

class OrdersStatisticsStarted extends OrdersEvent{
  final List<Order> orders;

  OrdersStatisticsStarted(this.orders);
}