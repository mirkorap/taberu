import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stilo/stilo.dart';
import 'package:taberu/injection.dart';
import 'package:taberu/restaurant_menu/application/restaurant_selection/restaurant_selection_cubit.dart';
import 'package:taberu/restaurant_menu/presentation/restaurant_selection/widgets/restaurant_selection_body.dart';
import 'package:taberu/restaurant_menu/presentation/restaurant_selection/widgets/restaurant_selection_header.dart';

class RestaurantSelectionScreen extends StatelessWidget {
  const RestaurantSelectionScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<RestaurantSelectionCubit>(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: const [
              AspectRatio(
                aspectRatio: 1.2,
                child: RestaurantSelectionHeader(),
              ),
              Padding(
                padding: StiloEdge.a16,
                child: RestaurantSelectionBody(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
