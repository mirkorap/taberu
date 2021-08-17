import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taberu/restaurant_menu/application/restaurant_selection/restaurant_selection_cubit.dart';
import 'package:taberu/restaurant_menu/domain/entities/restaurant.dart';
import 'package:taberu/router.gr.dart';
import 'package:taberu/themes/app_button.dart';
import 'package:taberu/themes/app_color.dart';

class RestaurantSelectionButton extends StatelessWidget {
  final Restaurant? restaurant;

  const RestaurantSelectionButton({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestaurantSelectionCubit, RestaurantSelectionState>(
      builder: (context, state) {
        return IgnorePointer(
          ignoring: restaurant == null || state == const RestaurantSelectionState.actionInProgress(),
          child: ElevatedButtonTheme(
            data: restaurant != null ? AppButton.roundedButton : AppButton.disabledRoundedButton,
            child: ElevatedButton(
              onPressed: () async {
                final cubit = context.read<RestaurantSelectionCubit>();
                await cubit.selectRestaurant(restaurant!);
                context.replaceRoute(const DishesSelectionScreen());
              },
              child: state.maybeWhen(
                actionInProgress: () => const CircularProgressIndicator(
                  valueColor: AppColor.actionProgressIndicator,
                ),
                orElse: () => const Text('restaurant_selection.show_menu').tr(),
              ),
            ),
          ),
        );
      },
    );
  }
}
