import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stilo/stilo.dart';
import 'package:taberu/restaurant_menu/application/dish_actor/dish_actor_cubit.dart';
import 'package:taberu/restaurant_menu/domain/entities/dish.dart';
import 'package:taberu/themes/app_color.dart';

class DishToOrderButton extends StatelessWidget {
  final Dish dish;

  const DishToOrderButton({
    Key? key,
    required this.dish,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DishActorCubit, DishActorState>(
      builder: (context, state) {
        return Padding(
          padding: StiloEdge.all6,
          child: TextButton(
            onPressed: () {
              final cubit = context.read<DishActorCubit>();
              cubit.addToOrder(dish);
            },
            child: state.maybeWhen(
              actionInProgress: () => const CircularProgressIndicator(
                valueColor: AppColor.actionProgressIndicator,
              ),
              orElse: () => const Text('app.actions.add_to_order').tr(),
            ),
          ),
        );
      },
    );
  }
}
