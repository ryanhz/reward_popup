import 'package:flutter/material.dart';
import 'package:reward_popup/view/mesh.dart';
import 'package:reward_popup/view/reward_card.dart';

class RewardPopupPage extends StatefulWidget {
  const RewardPopupPage({super.key, required this.child, this.precursorWidget, this.enableDismissByTappingOutside, this.dismissButton, this.backgroundColor});

  ///The child of type [Widget] will be shown in the popup
  final Widget child;

  ///The [Widget] that will be shown for animation as a precursor to the child widget. Optional parameter, in case not available default animation will be shown.
  final Widget? precursorWidget;

  ///If set to true, the popup will be dismissed by tapping outside the popup. Default value is true.
  final bool? enableDismissByTappingOutside;

  ///The [Widget] that will be shown as a dismiss button. Optional parameter, in case not available default dismiss button will be shown.
  final Widget? dismissButton;

  ///The [Color] that will be shown as a background color. Optional parameter, in case not available default background color will be shown.
  final Color? backgroundColor;
  @override
  State<RewardPopupPage> createState() => _RewardPopupPageState();
}

class _RewardPopupPageState extends State<RewardPopupPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.enableDismissByTappingOutside ?? true) {
          Navigator.of(context).pop();
        }
      },
      child: Material(
        color: Colors.transparent,
        child: Stack(
          children: [
            const BackgroundMesh(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (widget.dismissButton != null) Align(alignment: Alignment.centerRight, child: widget.dismissButton!),
                RewardCard(
                  precursorWidget: widget.precursorWidget,
                  backgroundColor: widget.backgroundColor,
                  child: widget.child,
                ),
                SizedBox(width: MediaQuery.of(context).size.width),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
