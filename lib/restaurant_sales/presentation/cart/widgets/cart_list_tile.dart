import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:stilo/stilo.dart';
import 'package:taberu/restaurant_menu/presentation/widgets/dish_card/dish_card_image.dart';
import 'package:taberu/restaurant_sales/domain/entities/order_item.dart';
import 'package:taberu/restaurant_sales/presentation/cart/widgets/cart_quantity.dart';
import 'package:taberu/themes/app_color.dart';
import 'package:taberu/themes/app_list_tile.dart';
import 'package:taberu/themes/app_text_style.dart';

class CartListTile extends StatelessWidget {
  final VoidCallback onDelete;
  final VoidCallback onDecreaseQuantity;
  final VoidCallback onIncreaseQuantity;
  final OrderItem orderItem;

  const CartListTile({
    Key? key,
    required this.onDelete,
    required this.onDecreaseQuantity,
    required this.onIncreaseQuantity,
    required this.orderItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: const SlidableDrawerActionPane(),
      secondaryActions: [
        _buildDeleteAction(),
      ],
      child: Container(
        decoration: AppListTile.cartListTile,
        child: ClipRRect(
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
                CartQuantity(
                  quantity: orderItem.quantity,
                  onDecreasePressed: onDecreaseQuantity,
                  onIncreasePressed: onIncreaseQuantity,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDeleteAction() {
    return Padding(
      padding: StiloEdge.all3,
      child: SlideAction(
        onTap: onDelete,
        decoration: const BoxDecoration(
          color: AppColor.danger,
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.delete,
          color: StiloColor.white,
          size: 30.0,
        ),
      ),
    );
  }
}
