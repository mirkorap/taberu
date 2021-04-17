import 'package:flutter/material.dart';
import 'package:kt_dart/kt.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stilo/stilo.dart';
import 'package:taberu/restaurant_menu/domain/entities/dish_image.dart';
import 'package:taberu/restaurant_menu/presentation/widgets/dish_card/dish_card_image.dart';
import 'package:taberu/themes/app_color.dart';

class DishImageGallery extends StatelessWidget {
  final controller = PageController();
  final KtList<DishImage> gallery;

  DishImageGallery({
    Key key,
    @required this.gallery,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: StiloWidth.w56,
          height: StiloHeight.h56,
          child: PageView.builder(
            physics: const BouncingScrollPhysics(),
            controller: controller,
            itemCount: gallery.size,
            itemBuilder: (context, index) {
              return Card(
                color: StiloColor.transparent,
                elevation: StiloElevation.z0,
                child: DishCardImage(image: gallery[index]),
              );
            },
          ),
        ),
        StiloSpacing.y10,
        SmoothPageIndicator(
          controller: controller,
          count: gallery.size,
          effect: const JumpingDotEffect(
            dotWidth: StiloWidth.w3,
            dotHeight: StiloHeight.h3,
            activeDotColor: AppColor.primary,
          ),
        ),
      ],
    );
  }
}
