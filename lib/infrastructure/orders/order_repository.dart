import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:flutter/services.dart';

import '../../infrastructure/orders/asset_paths.dart';
import '../../domain/orders/orders_statistics.dart';
import '../../domain/orders/graph_information.dart';
import '../../application/orders/orders_bloc.dart';
import '../../domain/orders/graph_statistics.dart';
import '../../domain/orders/order.dart';

abstract class BaseOrderRepository {
  Future<OrdersState> getAllOrders();
  OrderStatistics calculateOrdersStatistics(List<Order> orders);
  GraphStatistics getGraphInformation(List<Order> orders);
}

class OrderRepository implements BaseOrderRepository {
  @override
  Future<OrdersState> getAllOrders() async {
    OrdersState ordersState;
    OrderStatistics orderStatistics;
    GraphStatistics graphStatistics;
    List<Order> orders = List.empty(growable: true);
    try {
      final ByteData jsonData = await rootBundle.load(AssetPath.ORDERS_DATA);
      final String jsonString = utf8.decode(jsonData.buffer.asUint8List());
      final List body = json.decode(jsonString);
      orders.addAll(body.map((order) => Order.fromJson(order)));

      await Future.delayed(const Duration(seconds: 2));

      orderStatistics = calculateOrdersStatistics(orders);
      graphStatistics = getGraphInformation(orders);

      ordersState = OrdersLoadedSuccessfully(
          orders: orders,
          orderStatistics: orderStatistics,
          graphStatistics: graphStatistics);
    } catch (e) {
      ordersState = OrdersLoadedFailure(e.toString());
    }
    return ordersState;
  }

  @override
  OrderStatistics calculateOrdersStatistics(List<Order> orders) {
    OrderStatistics orderStatistics = OrderStatistics.empty;
    final int totalOrder = orders.length;
    int totalReturns = 0;
    double totalPrices = 0.0;
    final formatCurrency = NumberFormat.simpleCurrency();

    for (var order in orders) {
      totalReturns = totalReturns + (order.status == "RETURNED" ? 1 : 0);
      totalPrices += double.parse(order.price);
    }

    orderStatistics = OrderStatistics(
        totalOrders: totalOrder,
        numberOfReturns: totalReturns,
        averagePrice: formatCurrency.format(totalPrices / totalOrder));
    return orderStatistics;
  }

  @override
  GraphStatistics getGraphInformation(List<Order> orders) {
    List<GraphInformation> graphInformation = List.empty(growable: true);
    late GraphStatistics graphStatistics;

    for (var order in orders) {
      graphInformationRowMap[_monthsInYear[int.parse(order.registered.substring(5, 7))]!] =
          (graphInformationRowMap[_monthsInYear[int.parse(order.registered.substring(5, 7))]!]?? 0) + 1;
    }

    graphInformationRowMap.forEach((month, orders) {
      if(orders == 0){
        return;
      }
      return graphInformation
          .add(GraphInformation(monthName: month, monthOrdersNumber: orders));
    });

    graphStatistics = GraphStatistics(
        graphInformation: graphInformation,
    );
    return graphStatistics;
  }

  final Map<String, int> graphInformationRowMap = {
    "Jan":  0,
    "Feb":  0,
    "Mar":  0,
    "Apr":  0,
    "May":  0,
    "Jun":  0,
    "Jul":  0,
    "Aug":  0,
    "Sep":  0,
    "Oct":  0,
    "Nov":  0,
    "Dec":  0
  };

  final Map<int, String> _monthsInYear = {
    1: "Jan",
    2: "Feb",
    3: "Mar",
    4: "Apr",
    5: "May",
    6: "Jun",
    7: "Jul",
    8: "Aug",
    9: "Sep",
    10: "Oct",
    11: "Nov",
    12: "Dec"
  };
}
