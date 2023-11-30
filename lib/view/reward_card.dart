import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/services.dart';

class RewardCard extends StatefulWidget {
  const RewardCard({super.key, required this.child, this.precursorWidget, this.backgroundColor});

  ///The child of type [Widget] will be shown in the popup
  final Widget child;

  ///The [Widget] that will be shown for animation as a precursor to the child widget. Optional parameter, in case not available default animation will be shown.
  final Widget? precursorWidget;

  ///The [Color] that will be shown as a background color. Optional parameter, in case not available default background color will be shown.
  final Color? backgroundColor;
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

  Future<Uint8List> loadAsset() async {
    ByteData data = await rootBundle
        .load('packages/reward_popup/assets/lottie/animation.json');
    return data.buffer.asUint8List();
  }

  @override
  void dispose() {
    _scaleController.dispose();
    _lottieController.dispose();
    _shineOffsetController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.precursorWidget ??
            SizedBox(
              height: 320,
              width: 280,
              child: FutureBuilder(
                future: loadAsset(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return LottieBuilder.memory(
                      snapshot.data ?? Uint8List.fromList([]),
                      height: 320,
                      width: 280,
                      repeat: false,
                      controller: _lottieController,
                    );
                  }
                  return const SizedBox();
                },
              ),
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
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: widget.backgroundColor),
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
                                color: widget.backgroundColor?.withOpacity(0.05),
                              ),
                              const SizedBox(height: 320),
                              Container(
                                width: 280,
                                height: 320,
                                color: widget.backgroundColor?.withOpacity(0.05),
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
