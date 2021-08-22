import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart' hide Order;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';
import 'package:taberu/restaurant_menu/application/services/i_selected_restaurant_storage.dart';
import 'package:taberu/restaurant_menu/domain/entities/dish.dart';
import 'package:taberu/restaurant_menu/domain/entities/restaurant_table.dart';
import 'package:taberu/restaurant_sales/application/services/i_current_order_storage.dart';
import 'package:taberu/restaurant_sales/domain/entities/order.dart';
import 'package:taberu/restaurant_sales/domain/entities/order_item.dart';
import 'package:taberu/restaurant_sales/domain/enums/order_state.dart';
import 'package:taberu/restaurant_sales/domain/enums/order_type.dart';
import 'package:taberu/restaurant_sales/domain/failures/order_failure.dart';
import 'package:taberu/restaurant_sales/domain/repositories/i_order_repository.dart';
import 'package:taberu/restaurant_sales/domain/value_objects/delivery_address.dart';
import 'package:taberu/restaurant_sales/domain/value_objects/order_number.dart';

part 'cart_cubit.freezed.dart';

part 'cart_state.dart';

@injectable
class CartCubit extends Cubit<CartState> {
  final ISelectedRestaurantStorage _selectedRestaurantStorage;
  final ICurrentOrderStorage _currentOrderStorage;
  final IOrderRepository _orderRepository;

  CartCubit(
    this._selectedRestaurantStorage,
    this._currentOrderStorage,
    this._orderRepository,
  ) : super(CartState.initial());

  void initialize(Order initialOrder) {
    _currentOrderStorage.setOrder(initialOrder);

    emit(state.copyWith(
      order: initialOrder,
      saveFailureOrSuccessOption: none(),
    ));
  }

  void addOneToCart(Dish dish) {
    final orderItem = OrderItem.fromDish(dish);
    final order = state.order.addOrderItem(orderItem);
    _currentOrderStorage.setOrder(order);

    emit(state.copyWith(
      order: order,
      saveFailureOrSuccessOption: none(),
    ));
  }

  void removeOneFromCart(Dish dish) {
    final orderItem = OrderItem.fromDish(dish);
    final order = state.order.removeOrderItem(orderItem);
    _currentOrderStorage.setOrder(order);

    emit(state.copyWith(
      order: order,
      saveFailureOrSuccessOption: none(),
    ));
  }

  void deleteFromCart(Dish dish) {
    final orderItem = state.order.orderItems.first((element) => element.dish == dish);
    final order = state.order.deleteOrderItem(orderItem);
    _currentOrderStorage.setOrder(order);

    emit(state.copyWith(
      order: order,
      saveFailureOrSuccessOption: none(),
    ));
  }

  void changeOrderType(OrderType orderType) {
    final order = state.order.copyWith(
      type: orderType,
      restaurantTable: null,
      deliveryAddress: null,
    );

    emit(state.copyWith(
      order: order,
      saveFailureOrSuccessOption: none(),
    ));
  }

  void changeRestaurantTable(RestaurantTable restaurantTable) {
    final order = state.order.copyWith(restaurantTable: restaurantTable);

    emit(state.copyWith(
      order: order,
      saveFailureOrSuccessOption: none(),
    ));
  }

  void updateDeliveryCity(String city) {
    final deliveryAddress = optionOf(state.order.deliveryAddress).fold(
      () => DeliveryAddress(city: city),
      (e) => e.copyWith(city: city),
    );

    final order = state.order.copyWith(deliveryAddress: deliveryAddress);

    emit(state.copyWith(
      order: order,
      saveFailureOrSuccessOption: none(),
    ));
  }

  void updateDeliveryPostalCode(String postalCode) {
    final deliveryAddress = optionOf(state.order.deliveryAddress).fold(
      () => DeliveryAddress(postalCode: postalCode),
      (e) => e.copyWith(postalCode: postalCode),
    );

    final order = state.order.copyWith(deliveryAddress: deliveryAddress);

    emit(state.copyWith(
      order: order,
      saveFailureOrSuccessOption: none(),
    ));
  }

  void updateDeliveryStreet(String street) {
    final deliveryAddress = optionOf(state.order.deliveryAddress).fold(
      () => DeliveryAddress(street: street),
      (e) => e.copyWith(street: street),
    );

    final order = state.order.copyWith(deliveryAddress: deliveryAddress);

    emit(state.copyWith(
      order: order,
      saveFailureOrSuccessOption: none(),
    ));
  }

  void updateDeliveryFirstName(String firstName) {
    final deliveryAddress = optionOf(state.order.deliveryAddress).fold(
      () => DeliveryAddress(firstName: firstName),
      (e) => e.copyWith(firstName: firstName),
    );

    final order = state.order.copyWith(deliveryAddress: deliveryAddress);

    emit(state.copyWith(
      order: order,
      saveFailureOrSuccessOption: none(),
    ));
  }

  void updateDeliveryLastName(String lastName) {
    final deliveryAddress = optionOf(state.order.deliveryAddress).fold(
      () => DeliveryAddress(lastName: lastName),
      (e) => e.copyWith(lastName: lastName),
    );

    final order = state.order.copyWith(deliveryAddress: deliveryAddress);

    emit(state.copyWith(
      order: order,
      saveFailureOrSuccessOption: none(),
    ));
  }

  void updateDeliveryPhone(String phone) {
    final deliveryAddress = optionOf(state.order.deliveryAddress).fold(
      () => DeliveryAddress(phone: phone),
      (e) => e.copyWith(phone: phone),
    );

    final order = state.order.copyWith(deliveryAddress: deliveryAddress);

    emit(state.copyWith(
      order: order,
      saveFailureOrSuccessOption: none(),
    ));
  }

  void updateNotes(String notes) {
    final order = state.order.copyWith(notes: notes);

    emit(state.copyWith(
      order: order,
      saveFailureOrSuccessOption: none(),
    ));
  }

  Future<void> saveOrder() async {
    emit(state.copyWith(isSaving: true, saveFailureOrSuccessOption: none()));

    final selectedRestaurant = _selectedRestaurantStorage.getRestaurant();
    final selectedRestaurantId = selectedRestaurant.id.getOrCrash();

    // TODO: manage other Firebase failures
    final lastOrder = await _orderRepository.getLastRestaurantOrder(selectedRestaurantId);
    final nextOrderNumber = lastOrder.fold(
      (_) => OrderNumber(1),
      (order) => order.number.next(),
    );

    final order = state.order.copyWith(
      number: nextOrderNumber,
      state: OrderState.pending,
    );

    // TODO: call method only on order without any failures
    final failureOrSuccess = await _orderRepository.create(order);

    state.copyWith(
      order: order,
      isSaving: false,
      saveFailureOrSuccessOption: optionOf(failureOrSuccess),
    );
  }
}
