import 'package:flutter/material.dart';
import 'package:stilo/stilo.dart';

class DishCardImage extends StatelessWidget {
  final String dishImageUrl;

  const DishCardImage({
    Key key,
    @required this.dishImageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130.0,
      height: 130.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: StiloBoxShadow.md,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(dishImageUrl),
        ),
      ),
    );
  }
}
