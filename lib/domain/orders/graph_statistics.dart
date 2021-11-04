import 'graph_information.dart';

class GraphStatistics{
  List<GraphInformation> graphInformation;
  int minOrders, maxOrders;

  GraphStatistics({
    required this.graphInformation,
    this.minOrders = 0,
    this.maxOrders = 0
  });
}