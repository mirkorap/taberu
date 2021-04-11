import 'package:flutter/material.dart';
import 'package:taberu/restaurant_menu/domain/entities/dish.dart';

class DishDetailsScreen extends StatelessWidget {
  final Dish dish;

  const DishDetailsScreen({
    Key key,
    @required this.dish,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello World'),
      ),
    );
  }
}
