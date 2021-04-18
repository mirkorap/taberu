import 'package:flutter/material.dart' hide BottomNavigationBar;
import 'package:taberu/core/presentation/widgets/navigation_bars/bottom_navigation_bar.dart';

class RestaurantContactsScreen extends StatelessWidget {
  const RestaurantContactsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Hello World'),
      ),
      bottomNavigationBar: BottomNavigationBar(),
    );
  }
}
