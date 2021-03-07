import 'package:flutter/material.dart';
import 'package:taberu/restaurant_menu/presentation/widgets/dish_card/dish_card_body.dart';
import 'package:taberu/restaurant_menu/presentation/widgets/dish_card/dish_card_image.dart';
import 'package:taberu/themes/app_card.dart';

class DishCard extends StatelessWidget {
  const DishCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220.0,
      decoration: AppCard.dishCard,
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 80.0),
            child: DishCardBody(
              dishName: 'Veggie tomato mix',
              dishPrice: '20,00€',
            ),
          ),
          const Align(
            alignment: Alignment(0.0, -1.5),
            child: DishCardImage(
              dishImageUrl: 'https://featfood.it/wp-content/uploads/2020/11/7_pokesalmone-min.png',
            ),
          ),
        ],
      ),
    );
  }
}
