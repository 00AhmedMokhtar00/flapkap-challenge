import 'package:flutter/material.dart';

import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/orders/orders_bloc.dart';
import '../../view_helpers/text_values.dart';
import 'widgets/statics_widget.dart';
import 'widgets/graph_widget.dart';

class HomePage extends StatelessWidget {
  static const String routeName = "/home-page";
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey.shade50,
        body: BlocBuilder<OrdersBloc, OrdersState>(
          builder: (_, state) {
            if (state is OrdersLoadedSuccessfully) {
              return Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      ResponsiveRowColumn(
                        columnSpacing: 20.0,
                        rowSpacing: 20.0,
                        layout:
                            ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                                ? ResponsiveRowColumnType.COLUMN
                                : ResponsiveRowColumnType.ROW,
                        children: [
                          ResponsiveRowColumnItem(
                            rowFlex: 1,
                            child: StatisticsWidget(
                                title: TextValue.TOTAL_ORDERS_TEXT,
                                statisticalData:
                                    state.orderStatistics.totalOrders.toString()),
                          ),
                          ResponsiveRowColumnItem(
                            rowFlex: 1,
                            child: StatisticsWidget(
                                title: TextValue.AVERAGE_PRICE_TEXT,
                                statisticalData: state
                                    .orderStatistics.averagePrice
                                    .toString()),
                          ),
                          ResponsiveRowColumnItem(
                            rowFlex: 1,
                            child: StatisticsWidget(
                                title: TextValue.NUMBER_OF_RETURNS_TEXT,
                                statisticalData: state
                                    .orderStatistics.numberOfReturns
                                    .toString()),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      GraphWidget(graphStatistics: state.graphStatistics)
                    ],
                  ),
                ),
              );
            }

            return Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    ResponsiveRowColumn(
                      columnSpacing: 20.0,
                      rowSpacing: 20.0,
                      layout: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                          ? ResponsiveRowColumnType.COLUMN
                          : ResponsiveRowColumnType.ROW,
                      children: [
                        ResponsiveRowColumnItem(
                            child: StatisticsWidget(loading: true), rowFlex: 1),
                        //ResponsiveRowColumnItem(child: SizedBox(height: 40)),
                        ResponsiveRowColumnItem(
                            child: StatisticsWidget(loading: true), rowFlex: 1),
                        //ResponsiveRowColumnItem(child: SizedBox(height: 40)),
                        ResponsiveRowColumnItem(
                            child: StatisticsWidget(loading: true), rowFlex: 1),
                      ],
                    ),
                    const SizedBox(height: 50),
                    const GraphWidget(loading: true)
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
