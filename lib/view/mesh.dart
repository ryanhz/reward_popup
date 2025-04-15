import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class BackgroundMesh extends StatefulWidget {
  const BackgroundMesh({super.key});

  @override
  State<BackgroundMesh> createState() => _BackgroundMeshState();
}

class _BackgroundMeshState extends State<BackgroundMesh>
    with TickerProviderStateMixin {
  late AnimationController _firstController;
  late AnimationController _secondController;
  late AnimationController _thirdController;

  late Animation<double> _firstSize;
  late Animation<double> _secondSize;
  late Animation<double> _thirdSize;

  @override
  void initState() {
    super.initState();
    _firstController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 4000));
    _secondController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 4000));
    _thirdController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 4000));

    _firstSize = Tween<double>(begin: 0, end: 1000).animate(_firstController);
    _secondSize = Tween<double>(begin: 0, end: 1000).animate(_secondController);
    _thirdSize = Tween<double>(begin: 0, end: 1000).animate(_thirdController);

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) async {
      startAnimations();
    });
  }

  Future<void> startAnimations() async {
    _firstController.repeat();
    await Future.delayed(const Duration(milliseconds: 1000));
    if (!mounted) return;
    _secondController.repeat();
    await Future.delayed(const Duration(milliseconds: 1000));
    if (!mounted) return;
    _thirdController.repeat();
  }

  @override
  void dispose() {
    _firstController.dispose();
    _secondController.dispose();
    _thirdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AnimatedBuilder(
      animation: _firstController,
      builder: (context, child) => AnimatedBuilder(
        animation: _secondController,
        builder: (context, child) => AnimatedBuilder(
          animation: _thirdController,
          builder: (context, child) => Stack(
            children: [
              Positioned(
                top: (size.height - _firstSize.value) / 2,
                left: (size.width - _firstSize.value) / 2,
                child: Container(
                  height: _firstSize.value,
                  width: _firstSize.value,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.white, width: 0.5),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Positioned(
                top: (size.height - _secondSize.value) / 2,
                left: (size.width - _secondSize.value) / 2,
                child: Container(
                  height: _secondSize.value,
                  width: _secondSize.value,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.white, width: 0.5),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Positioned(
                top: (size.height - _thirdSize.value) / 2,
                left: (size.width - _thirdSize.value) / 2,
                child: Container(
                  height: _thirdSize.value,
                  width: _thirdSize.value,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.white, width: 0.5),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
