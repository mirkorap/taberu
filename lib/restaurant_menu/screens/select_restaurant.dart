import 'package:flutter/material.dart';
import 'package:stilo/stilo.dart';
import 'package:taberu/restaurant_menu/widgets/forms/select_restaurant_form.dart';
import 'package:taberu/restaurant_menu/widgets/containers/logo_box_container.dart';
import 'package:url_launcher/url_launcher.dart';

class SelectRestaurantScreen extends StatelessWidget {
  const SelectRestaurantScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AspectRatio(
              aspectRatio: 1.5,
              child: LogoBoxContainer(),
            ),
            Padding(
              padding: StiloEdge.a16,
              child: SelectRestaurantForm(
                onCreateMenu: () => launch('http://example.com'),
                onShowMenu: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
