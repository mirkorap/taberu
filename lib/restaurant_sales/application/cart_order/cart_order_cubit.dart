import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart' hide Order;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:taberu/restaurant_menu/domain/entities/dish.dart';
import 'package:taberu/restaurant_sales/domain/entities/order.dart';
import 'package:taberu/restaurant_sales/domain/entities/order_item.dart';
import 'package:taberu/restaurant_sales/domain/failures/order_failure.dart';

part 'cart_order_cubit.freezed.dart';

part 'cart_order_state.dart';

@injectable
class CartOrderCubit extends Cubit<CartOrderState> {
  CartOrderCubit() : super(CartOrderState.initial());

  void addDishToOrder(Dish dish) {
    final orderItem = OrderItem.fromDish(dish);
    final order = state.order.addOrderItem(orderItem);
    emit(state.copyWith(order: order));
  }
}
