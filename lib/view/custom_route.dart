import 'package:flutter/material.dart';

///This route is used to add the reward popup widget to the navigation stack
class CustomRoute<T> extends PageRouteBuilder<T> {
  CustomRoute({required super.pageBuilder})
      : super(
          opaque: false,
          barrierColor: Colors.white.withOpacity(0.75),
        );
}
