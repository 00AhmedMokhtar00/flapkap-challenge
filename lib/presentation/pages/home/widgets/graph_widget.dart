import 'package:flutter/material.dart';

import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../domain/orders/graph_information.dart';
import '../../../../domain/orders/graph_statistics.dart';
import '../../../view_helpers/text_values.dart';

class GraphWidget extends StatelessWidget {
  final bool loading;
  final GraphStatistics? graphStatistics;

  const GraphWidget({Key? key, this.graphStatistics, this.loading = false})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.maxFinite,
        height: 510,
        padding: const EdgeInsets.all(20),
        color: Colors.white,
        child: loading
            ? Center(
            child: GradientProgressIndicator(
              gradient: Gradients.taitanum,
            ))
            : SfCartesianChart(
            primaryXAxis: CategoryAxis(
                labelStyle: const TextStyle(color: Colors.black),
                majorGridLines: MajorGridLines(color: Colors.grey.shade300)
            ),
            primaryYAxis: NumericAxis(
                labelStyle: const TextStyle(color: Colors.black),
                majorGridLines: MajorGridLines(color: Colors.grey.shade300)
            ),
            title: ChartTitle(
              text: TextValue.PRODUCT_SALES_TEXT,
              textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
              alignment: ChartAlignment.near,
            ),
            // Enable legend
            legend: Legend(isVisible: true, textStyle: const TextStyle(color: Colors.black)),
            tooltipBehavior: TooltipBehavior(enable: true),
            series: <ChartSeries<GraphInformation, String>>[
              ColumnSeries<GraphInformation, String>(
                  dataSource: graphStatistics!.graphInformation,
                  xValueMapper: (GraphInformation graphInformation, _) => graphInformation.monthName,
                  yValueMapper: (GraphInformation graphInformation, _) => graphInformation.monthOrdersNumber,
                  name: TextValue.SALES_TEXT,
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  dataLabelSettings: const DataLabelSettings(isVisible: true))
            ]));
  }
}