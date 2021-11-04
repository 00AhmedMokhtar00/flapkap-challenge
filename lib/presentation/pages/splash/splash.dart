import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/orders/orders_bloc.dart';
import 'widgets/server_error_widget.dart';
import 'widgets/splash_widget.dart';
import '../../pages/home/home.dart';


class SplashPage extends StatelessWidget {
  static const String routeName = "/splash";
  Widget view = const SplashWidget();

  SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrdersBloc, OrdersState>(
      listener: (context, state) {
        if(state is OrdersLoadedSuccessfully){
          Navigator.pushReplacementNamed(context, HomePage.routeName);
        } else if(state is OrdersLoadedFailure){
          view = const ServerErrorWidget();
        }
      },
      child: view,
    );
  }
}