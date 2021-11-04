import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

class StatisticsWidget extends StatelessWidget {
  final bool loading;
  final String? title;
  final String? statisticalData;
  const StatisticsWidget(
      {Key? key, this.title, this.statisticalData, this.loading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.maxFinite,
        padding: const EdgeInsets.all(20),
        color: Colors.white,
        child: loading
            ? Center(
            child: GradientProgressIndicator(
              gradient: Gradients.taitanum,
              value: 0.65,
            )
        )
            : Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              title!,
              style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            Text(
              statisticalData!,
              textAlign: TextAlign.end,
              style: const TextStyle(
                  fontSize: 28,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ));
  }
}