part of 'orders_bloc.dart';

abstract class OrdersState {
  const OrdersState();
}

class OrdersInitial extends OrdersState {
  const OrdersInitial();
}

class OrdersLoading extends OrdersState {
  const OrdersLoading();
}

class OrdersLoadedSuccessfully extends OrdersState {
  List<Order> orders;
  OrderStatistics orderStatistics;
  GraphStatistics graphStatistics;
  OrdersLoadedSuccessfully({required this.orders, required this.orderStatistics, required this.graphStatistics});
}

class OrdersLoadedFailure extends OrdersState {
  String errorMessage;
  OrdersLoadedFailure(this.errorMessage);
}

class OrdersStatisticsLoadedSuccessfully extends OrdersState {
  OrderStatistics orderStatistics;
  OrdersStatisticsLoadedSuccessfully(this.orderStatistics);
}

class OrdersStatisticsLoadedFailure extends OrdersState {
  String errorMessage;
  OrdersStatisticsLoadedFailure(this.errorMessage);
}

class OrdersGraphLoadedSuccessfully extends OrdersState {
  GraphStatistics graphStatistics;
  OrdersGraphLoadedSuccessfully(this.graphStatistics);
}

class OrdersGraphLoadedFailure extends OrdersState {
  String errorMessage;
  OrdersGraphLoadedFailure(this.errorMessage);
}
