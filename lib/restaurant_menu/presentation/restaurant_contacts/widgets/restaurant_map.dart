import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taberu/core/domain/value_objects/position.dart';
import 'package:taberu/core/infrastructure/extension_methods/dartz_value_object.dart';
import 'package:taberu/themes/app_image.dart';

class RestaurantMap extends StatelessWidget {
  final Position position;

  const RestaurantMap({
    Key key,
    @required this.position,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.0,
      child: FutureBuilder(
        future: _createRestaurantMarker(context),
        builder: (context, snapshot) {
          return GoogleMap(
            markers: {
              Marker(
                markerId: MarkerId('restaurant'),
                icon: snapshot.data as BitmapDescriptor,
                position: LatLng(
                  position.latitude.getOrCrash(),
                  position.longitude.getOrCrash(),
                ),
              ),
            },
            initialCameraPosition: CameraPosition(
              zoom: 18.0,
              target: LatLng(
                position.latitude.getOrCrash(),
                position.longitude.getOrCrash(),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<BitmapDescriptor> _createRestaurantMarker(BuildContext context) async {
    return BitmapDescriptor.fromAssetImage(
      createLocalImageConfiguration(context),
      AppImage.restaurantMarker,
    );
  }
}
