import 'package:flutter/material.dart';
import 'package:stilo/stilo.dart';
import 'package:taberu/restaurant_menu/domain/entities/dish.dart';
import 'package:taberu/restaurant_menu/presentation/widgets/dish_card/dish_card_body.dart';
import 'package:taberu/restaurant_menu/presentation/widgets/dish_card/dish_card_image.dart';
import 'package:taberu/themes/app_card.dart';

class DishCard extends StatelessWidget {
  final VoidCallback onTap;
  final Dish dish;

  const DishCard({
    Key? key,
    required this.onTap,
    required this.dish,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: StiloWidth.w48,
        decoration: AppCard.dishCard,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: StiloEdge.top24,
              child: DishCardBody(
                name: dish.name,
                price: dish.price,
              ),
            ),
            Align(
              alignment: const Alignment(0.0, -1.5),
              child: DishCardImage(image: dish.mainImage),
            ),
          ],
        ),
      ),
    );
  }
}
