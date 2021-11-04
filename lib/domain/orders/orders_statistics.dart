
class OrderStatistics {
  late final int totalOrders;
  late final String averagePrice;
  late final int numberOfReturns;

  OrderStatistics({
    required this.totalOrders,
    required this.averagePrice,
    required this.numberOfReturns,
  });

  static OrderStatistics empty = OrderStatistics(
    totalOrders: 0,
    averagePrice: "0.0",
    numberOfReturns: 0,
  );

  OrderStatistics copyWith({order, totalOrders, averagePrice, numberOfReturns}) => OrderStatistics(
    totalOrders: totalOrders ?? this.totalOrders,
    averagePrice: averagePrice ?? this.averagePrice,
    numberOfReturns: numberOfReturns ?? this.numberOfReturns,
  );
}

