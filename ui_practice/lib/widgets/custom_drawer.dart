import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CustomDrawer extends HookWidget {
  final double maxSlide = 225;
  void toggle(AnimationController controller) =>
      {controller.isDismissed ? controller.forward() : controller.reverse()};

  @override
  Widget build(BuildContext context) {
    final controller =
        useAnimationController(duration: Duration(milliseconds: 250));

    var myDrawer = Container(color: Colors.red);
    var child = Container(color: Colors.amber);
    return GestureDetector(
      onTap: () => {toggle(controller)},
      child: AnimatedBuilder(
          animation: controller,
          builder: (builder, _) {
            double slide = maxSlide * controller.value;
            double scale = 1 - (controller.value * .3);
            return Stack(
              children: [
                myDrawer,
                Transform(
                    transform: Matrix4.identity()
                      ..translate(slide)
                      ..scale(scale),
                    alignment: Alignment.centerLeft,
                    child: child)
              ],
            );
          }),
    );
  }
}
