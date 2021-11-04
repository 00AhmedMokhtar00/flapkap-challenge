import 'package:flutter/material.dart';

import '../../../../domain/orders/orders_statistics.dart';
import '../../../../domain/orders/graph_statistics.dart';
import 'statistics_widget.dart';
import 'graph_widget.dart';

class HomeBody extends StatelessWidget {
  final OrderStatistics? orderStatistics;
  final GraphStatistics? graphStatistics;
  final bool isLoading;
  const HomeBody({Key? key, this.orderStatistics, this.graphStatistics, this.isLoading = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            StatisticsWidget(orderStatistics: orderStatistics, loading: isLoading),
            const SizedBox(height: 30),
            GraphWidget(graphStatistics: graphStatistics, loading: isLoading)
          ],
        ),
      ),
    );
  }
}
