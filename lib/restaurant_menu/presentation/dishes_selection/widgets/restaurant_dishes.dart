import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:kt_dart/kt.dart';
import 'package:taberu/core/presentation/widgets/failures/failure_display.dart';
import 'package:taberu/restaurant_menu/application/dish_search/dish_search_cubit.dart';
import 'package:taberu/restaurant_menu/domain/entities/dish.dart';
import 'package:taberu/restaurant_menu/presentation/widgets/dish_card/dish_card.dart';
import 'package:taberu/router.gr.dart';
import 'package:taberu/themes/app_color.dart';

class RestaurantDishes extends StatelessWidget {
  final Axis scrollDirection;

  const RestaurantDishes({
    Key? key,
    required this.scrollDirection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: improve responsive for horizontal cards
    return BlocBuilder<DishSearchCubit, DishSearchState>(
      builder: (context, state) {
        return state.when(
          initial: () => Container(),
          searchInProgress: () {
            return const Expanded(
              child: Center(
                child: CircularProgressIndicator(
                  valueColor: AppColor.circularProgressIndicator,
                ),
              ),
            );
          },
          searchSuccess: (dishes) => _buildDishesGrid(dishes),
          searchFailure: (failure) {
            return Expanded(
              child: Center(
                child: FailureDisplay(
                  message: failure.when(
                    insufficientPermissions: () => tr('app.failures.insufficient_permissions'),
                    unexpected: () => tr('dishes_selection.failures.unexpected'),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildDishesGrid(KtList<Dish> dishes) {
    if (scrollDirection == Axis.vertical) {
      return _buildVerticalDishesGrid(dishes);
    }

    return _buildHorizontalDishesGrid(dishes);
  }

  Widget _buildVerticalDishesGrid(KtList<Dish> dishes) {
    return Expanded(
      child: StaggeredGridView.countBuilder(
        physics: const BouncingScrollPhysics(),
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        staggeredTileBuilder: (index) => const StaggeredTile.count(1, 1.8),
        itemCount: dishes.size,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              top: index.isEven ? 12.0 : 60.0,
              right: 6.0,
              left: 6.0,
              bottom: index.isEven ? 60.0 : 12.0,
            ),
            child: DishCard(
              onTap: () {
                context.pushRoute(DishDetailsScreen(dish: dishes[index]));
              },
              dish: dishes[index],
            ),
          );
        },
      ),
    );
  }

  Widget _buildHorizontalDishesGrid(KtList<Dish> dishes) {
    return Expanded(
      child: StaggeredGridView.countBuilder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        crossAxisCount: 1,
        staggeredTileBuilder: (index) => const StaggeredTile.count(1, 1),
        itemCount: dishes.size,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(
              top: 36.0,
              right: 36.0,
              left: 36.0,
              bottom: 6.0,
            ),
            child: DishCard(
              onTap: () {
                context.pushRoute(DishDetailsScreen(dish: dishes[index]));
              },
              dish: dishes[index],
            ),
          );
        },
      ),
    );
  }
}
