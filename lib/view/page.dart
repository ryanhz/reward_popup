import 'package:flutter/material.dart';
import 'package:reward_popup/view/mesh.dart';
import 'package:reward_popup/view/reward_card.dart';

class RewardPopupPage extends StatefulWidget {
  const RewardPopupPage({super.key, required this.child});
  final Widget child;

  @override
  State<RewardPopupPage> createState() => _RewardPopupPageState();
}

class _RewardPopupPageState extends State<RewardPopupPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          BackgroundMesh(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RewardCard(
                child: widget.child,
              ),
              SizedBox(width: MediaQuery.of(context).size.width),
            ],
          ),
        ],
      ),
    );
  }
}
