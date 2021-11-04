import 'package:flutter/material.dart';

import 'package:responsive_framework/responsive_framework.dart';

import '../../../../domain/orders/orders_statistics.dart';
import '../../../view_helpers/text_values.dart';
import 'statics_item.dart';

class StatisticsWidget extends StatelessWidget {
  final OrderStatistics? orderStatistics;
  final bool loading;

  const StatisticsWidget({Key? key, this.orderStatistics, this.loading = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveRowColumn(
      columnSpacing: 20.0,
      rowSpacing: 20.0,
      layout:
      ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
          ? ResponsiveRowColumnType.COLUMN
          : ResponsiveRowColumnType.ROW,
      children: [
        ResponsiveRowColumnItem(
          rowFlex: 1,
          child: StatisticsItem(
              loading: loading,
              title: TextValue.TOTAL_ORDERS_TEXT,
              statisticalData: orderStatistics?.totalOrders.toString()),
        ),
        ResponsiveRowColumnItem(
          rowFlex: 1,
          child: StatisticsItem(
              loading: loading,
              title: TextValue.AVERAGE_PRICE_TEXT,
              statisticalData: orderStatistics?.averagePrice
                  .toString()),
        ),
        ResponsiveRowColumnItem(
          rowFlex: 1,
          child: StatisticsItem(
              loading: loading,
              title: TextValue.NUMBER_OF_RETURNS_TEXT,
              statisticalData: orderStatistics?.numberOfReturns
                  .toString()),
        ),
      ],
    );
  }
}
