import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';

class RewardCard extends StatefulWidget {
  const RewardCard({super.key, required this.child});

  final Widget child;

  @override
  State<RewardCard> createState() => _RewardCardState();
}

class _RewardCardState extends State<RewardCard> with TickerProviderStateMixin {
  late AnimationController _scaleController;
  late AnimationController _lottieController;
  late AnimationController _shineOffsetController;

  late Animation<double> _scale;
  late Animation<double> _shineOne;

  @override
  void initState() {
    super.initState();
    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _shineOffsetController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _lottieController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _scale = Tween<double>(begin: 0, end: 1).animate(_scaleController);
    _shineOne =
        Tween<double>(begin: 0, end: -640).animate(_shineOffsetController);

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _lottieController.forward().then((value) => _scaleController
          .forward()
          .then((value) => _shineOffsetController.forward()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        LottieBuilder.asset(
          'assets/animation_ljy5rgiq.json',
          height: 320,
          width: 280,
          repeat: false,
          controller: _lottieController,
        ),
        AnimatedBuilder(
          animation: _scaleController,
          builder: (context, child) => Transform.scale(
            scale: _scale.value,
            child: Column(
              children: [
                Container(
                  width: 280,
                  height: 320,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: AnimatedBuilder(
                    animation: _shineOffsetController,
                    builder: (context, child) => Stack(
                      children: [
                        widget.child,
                        Positioned(
                          top: _shineOne.value,
                          left: 0,
                          child: Column(
                            children: [
                              Container(
                                width: 280,
                                height: 320,
                                color: Colors.black.withOpacity(0.05),
                              ),
                              const SizedBox(height: 320),
                              Container(
                                width: 280,
                                height: 320,
                                color: Colors.black.withOpacity(0.05),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
