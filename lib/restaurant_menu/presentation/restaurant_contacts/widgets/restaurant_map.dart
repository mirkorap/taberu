import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stilo/stilo.dart';
import 'package:taberu/core/domain/value_objects/position.dart';
import 'package:taberu/core/infrastructure/extension_methods/dartz_value_object.dart';
import 'package:taberu/themes/app_image.dart';

class RestaurantMap extends StatelessWidget {
  final Position position;

  const RestaurantMap({
    Key? key,
    required this.position,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: StiloHeight.h72,
      child: FutureBuilder(
        future: _createRestaurantMarker(context),
        builder: (context, AsyncSnapshot<BitmapDescriptor> snapshot) {
          return option(snapshot.hasData, snapshot.data).fold(
            () => const CircularProgressIndicator(),
            (data) => GoogleMap(
              markers: {
                Marker(
                  markerId: const MarkerId('restaurant'),
                  icon: data!,
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
