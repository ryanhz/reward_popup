import 'package:flutter/material.dart';

class CustomRoute extends PageRouteBuilder {
  CustomRoute({required super.pageBuilder})
      : super(
          opaque: false,
          barrierColor: Colors.white.withOpacity(0.75),
        );
}
