import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stilo/stilo.dart';
import 'package:taberu/core/presentation/widgets/failures/failure_display.dart';
import 'package:taberu/restaurant_menu/application/dish_search/dish_search_cubit.dart';
import 'package:taberu/restaurant_menu/presentation/widgets/dish_card/dish_card.dart';
import 'package:taberu/themes/app_color.dart';

class RestaurantDishes extends StatelessWidget {
  const RestaurantDishes({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          searchSuccess: (dishes) {
            return Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: dishes.size,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      top: StiloEdge.edge12,
                      right: StiloEdge.edge5,
                      left: StiloEdge.edge5,
                      bottom: StiloEdge.edge2,
                    ),
                    child: DishCard(dish: dishes[index]),
                  );
                },
              ),
            );
          },
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
}
