import 'package:flutter/material.dart';

class FloatingWidget extends StatefulWidget {
  final Duration animationDuration;
  final Widget child;
  final bool isBreather;

  const FloatingWidget({
    super.key,
    this.isBreather = false,
    this.animationDuration = const Duration(seconds: 2),
    required this.child,
  });

  @override
  State<StatefulWidget> createState() {
    return _FloatingWidget();
  }
}

class _FloatingWidget extends State<FloatingWidget>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  double progress = 0.0;

  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );

    final beginAnimation = widget.isBreather ? 0.85 : 0.0;
    final endAnimation = widget.isBreather ? 1.0 : 10.0;

    animation = Tween<double>(begin: beginAnimation, end: endAnimation).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.linear,
      ),
    )
      ..addStatusListener(
        (status) {
          if (status.isCompleted) {
            controller.reverse();
          } else if (status.isDismissed) {
            controller.forward();
          }
        },
      )
      ..addListener(() {
        setState(() => progress = animation.value);
      });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    if (widget.isBreather) {
      return Transform.scale(
        scale: progress,
        child: widget.child,
      );
    }
    return Transform.translate(
      offset: Offset(0, progress),
      child: widget.child,
    );
  }
}
