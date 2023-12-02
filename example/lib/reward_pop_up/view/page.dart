import 'package:example/reward_pop_up/view/mesh.dart';
import 'package:example/reward_pop_up/view/reward_card.dart';
import 'package:flutter/material.dart';

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
          const BackgroundMesh(),
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
