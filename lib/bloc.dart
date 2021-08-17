import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taberu/injection.dart';
import 'package:taberu/restaurant_menu/application/dish_details/dish_details_cubit.dart';
import 'package:taberu/restaurant_menu/application/restaurant_selection/restaurant_selection_cubit.dart';
import 'package:taberu/restaurant_sales/application/cart/cart_cubit.dart';
import 'package:taberu/restaurant_sales/application/services/i_current_order_storage.dart';

class AppBloc extends StatelessWidget {
  final Widget child;

  const AppBloc({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RestaurantSelectionCubit>(
          create: (context) => getIt<RestaurantSelectionCubit>(),
        ),
        BlocProvider<DishDetailsCubit>(
          create: (context) => getIt<DishDetailsCubit>(),
        ),
        BlocProvider<CartCubit>(
          create: (context) {
            final cubit = getIt<CartCubit>();
            final currentOrderStorage = getIt<ICurrentOrderStorage>();

            if (currentOrderStorage.containsOrder()) {
              cubit.initialize(currentOrderStorage.getOrder());
            }

            return cubit;
          },
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<RestaurantSelectionCubit, RestaurantSelectionState>(
            listener: (context, state) {
              state.maybeWhen(
                restaurantSelected: (restaurant) {
                  final currentOrderStorage = getIt<ICurrentOrderStorage>();
                  currentOrderStorage.clear();
                },
                orElse: () => null,
              );
            },
          ),
          BlocListener<DishDetailsCubit, DishDetailsState>(
            listener: (context, state) {
              state.maybeWhen(
                dishToCartButtonPressed: (dish) {
                  final cubit = context.read<CartCubit>();
                  cubit.addOneToCart(dish);
                },
                orElse: () => null,
              );
            },
          ),
        ],
        child: child,
      ),
    );
  }
}
