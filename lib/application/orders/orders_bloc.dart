import 'package:bloc/bloc.dart';
import 'package:flapkap_flutter_challenge/domain/orders/order.dart';
import 'package:flapkap_flutter_challenge/infrastructure/orders/order_repository.dart';

import '../../domain/orders/graph_statistics.dart';
import '../../domain/orders/orders_statistics.dart';

part 'orders_event.dart';
part 'orders_state.dart';



class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  final OrderRepository orderRepository;
  OrdersBloc(this.orderRepository) : super(const OrdersInitial());

  @override
  Stream<OrdersState> mapEventToState(
      OrdersEvent event,
      ) async* {
    yield const OrdersLoading();
    if(event is OrdersStartedEvent){
      yield await orderRepository.getAllOrders();
    }
  }
}