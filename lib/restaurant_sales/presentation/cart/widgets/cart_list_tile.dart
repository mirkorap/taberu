import 'package:flutter/material.dart';
import 'package:stilo/stilo.dart';
import 'package:taberu/restaurant_menu/presentation/widgets/dish_card/dish_card_image.dart';
import 'package:taberu/restaurant_sales/domain/entities/order_item.dart';
import 'package:taberu/restaurant_sales/presentation/cart/widgets/cart_quantity.dart';
import 'package:taberu/themes/app_text_style.dart';

class CartListTile extends StatelessWidget {
  final OrderItem orderItem;

  const CartListTile({
    Key? key,
    required this.orderItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: StiloBorderRadius.allXl3,
      child: ListTile(
        tileColor: StiloColor.white,
        contentPadding: StiloEdge.all4,
        leading: SizedBox(
          width: StiloWidth.w16,
          height: StiloHeight.h16,
          child: DishCardImage(image: orderItem.dish.mainImage),
        ),
        title: Text(
          orderItem.dish.name,
          style: Theme.of(context).textTheme.headline3,
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              orderItem.totalPrice.toString(),
              style: AppTextStyle.priceText,
            ),
            CartQuantity(quantity: orderItem.quantity),
          ],
        ),
      ),
    );
  }
}
