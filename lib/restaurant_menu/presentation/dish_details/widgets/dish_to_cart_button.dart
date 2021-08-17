import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stilo/stilo.dart';
import 'package:taberu/restaurant_menu/application/dish_details/dish_details_cubit.dart';
import 'package:taberu/restaurant_menu/domain/entities/dish.dart';
import 'package:taberu/themes/app_color.dart';

class DishToCartButton extends StatelessWidget {
  final Dish dish;

  const DishToCartButton({
    Key? key,
    required this.dish,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DishDetailsCubit, DishDetailsState>(
      builder: (context, state) {
        return IgnorePointer(
          ignoring: state == const DishDetailsState.actionInProgress(),
          child: Padding(
            padding: StiloEdge.all6,
            child: ElevatedButton(
              onPressed: () async {
                final cubit = context.read<DishDetailsCubit>();
                await cubit.pressDishToCartButton(dish);
              },
              child: state.maybeWhen(
                actionInProgress: () => const CircularProgressIndicator(
                  valueColor: AppColor.actionProgressIndicator,
                ),
                orElse: () => const Text('app.actions.add_to_order').tr(),
              ),
            ),
          ),
        );
      },
    );
  }
}
