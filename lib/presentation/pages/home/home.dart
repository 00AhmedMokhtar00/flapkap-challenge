import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/orders/orders_bloc.dart';
import 'widgets/home_body.dart';

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
              return HomeBody(
                orderStatistics: state.orderStatistics,
                graphStatistics: state.graphStatistics,
              );
            }
            return const HomeBody(isLoading: true,);
          },
        ),
      ),
    );
  }
}
