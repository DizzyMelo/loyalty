import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ColumnAnimationComponent extends StatelessWidget {
  final List<Widget> widgets;

  ColumnAnimationComponent({@required this.widgets});
  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView(
        children: AnimationConfiguration.toStaggeredList(
            duration: const Duration(milliseconds: 500),
            childAnimationBuilder: (widget) => SlideAnimation(
                horizontalOffset: 100, child: FadeInAnimation(child: widget)),
            children: widgets),
      ),
    );
  }
}
