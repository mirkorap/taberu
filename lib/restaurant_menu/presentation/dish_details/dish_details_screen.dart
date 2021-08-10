import 'package:flutter/material.dart';
import 'package:stilo/stilo.dart';
import 'package:taberu/core/presentation/widgets/navigation_bars/top_navigation_bar.dart';
import 'package:taberu/restaurant_menu/domain/entities/dish.dart';
import 'package:taberu/restaurant_menu/presentation/dish_details/widgets/dish_image_gallery.dart';
import 'package:taberu/restaurant_menu/presentation/dish_details/widgets/dish_information.dart';
import 'package:taberu/restaurant_menu/presentation/dish_details/widgets/dish_to_cart_button.dart';
import 'package:taberu/themes/app_text_style.dart';

class DishDetailsScreen extends StatelessWidget {
  final Dish dish;

  const DishDetailsScreen({
    Key? key,
    required this.dish,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopNavigationBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  DishImageGallery(
                    gallery: dish.gallery.getOrCrash(),
                  ),
                  StiloSpacing.vert8,
                  Text(
                    dish.name,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  StiloSpacing.vert3,
                  Text(
                    dish.price.toString(),
                    style: AppTextStyle.priceText,
                  ),
                ],
              ),
            ),
            StiloSpacing.vert8,
            Padding(
              padding: StiloEdge.horiz4,
              child: DishInformation(dish: dish),
            ),
          ],
        ),
      ),
      bottomNavigationBar: DishToCartButton(dish: dish),
    );
  }
}
