import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:stilo/stilo.dart';
import 'package:taberu/restaurant_menu/domain/entities/dish_image.dart';
import 'package:taberu/themes/app_image.dart';

class DishCardImage extends StatelessWidget {
  final DishImage image;

  const DishCardImage({
    Key key,
    @required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: StiloBoxShadow.md,
      ),
      child: ClipOval(
        child: CachedNetworkImage(
          width: StiloWidth.w32,
          height: StiloHeight.h32,
          fit: BoxFit.cover,
          placeholder: (context, url) => Image.asset(AppImage.dishPlaceholder),
          imageUrl: image.path.getOrCrash(),
        ),
      ),
    );
  }
}
