library reward_popup;

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:reward_popup/view/custom_route.dart';
import 'package:reward_popup/view/page.dart';

///Show a reward popup by calling this method and passing appropriate child patameter
Future<T?> showRewardPopup<T>(
  BuildContext context, {
  required Widget child,
  Widget? precursorWidget,
  bool? enableDismissByTappingOutside,
  Widget? dismissButton,
}) {
  return Navigator.of(context).push<T>(
    CustomRoute(
      pageBuilder: (context, _, __) => RewardPopupPage(
        precursorWidget: precursorWidget,
        enableDismissByTappingOutside: enableDismissByTappingOutside,
        dismissButton: dismissButton,
        child: child,
      ),
    ),
  );
}
