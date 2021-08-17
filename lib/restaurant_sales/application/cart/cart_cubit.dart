import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart' hide Order;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';
import 'package:taberu/restaurant_menu/domain/entities/dish.dart';
import 'package:taberu/restaurant_sales/application/services/i_current_order_storage.dart';
import 'package:taberu/restaurant_sales/domain/entities/order.dart';
import 'package:taberu/restaurant_sales/domain/entities/order_item.dart';
import 'package:taberu/restaurant_sales/domain/failures/order_failure.dart';

part 'cart_cubit.freezed.dart';

part 'cart_state.dart';

@injectable
class CartCubit extends Cubit<CartState> {
  final ICurrentOrderStorage _currentOrderStorage;

  CartCubit(this._currentOrderStorage) : super(CartState.initial());

  void addOneToCart(Dish dish) {
    final orderItem = OrderItem.fromDish(dish);
    final order = state.order.addOrderItem(orderItem);
    _currentOrderStorage.setOrder(order);
    emit(state.copyWith(order: order));
  }

  void removeOneFromCart(Dish dish) {
    final orderItem = OrderItem.fromDish(dish);
    final order = state.order.removeOrderItem(orderItem);
    _currentOrderStorage.setOrder(order);
    emit(state.copyWith(order: order));
  }

  void deleteFromCart(Dish dish) {
    final orderItem = state.order.orderItems.first((element) => element.dish == dish);
    final order = state.order.deleteOrderItem(orderItem);
    _currentOrderStorage.setOrder(order);
    emit(state.copyWith(order: order));
  }
}
