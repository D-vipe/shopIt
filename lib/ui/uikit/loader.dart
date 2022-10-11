// Flutter imports:
import 'package:flutter/material.dart';
import 'package:shop_it/app/constants/app_colors.dart';

// Package imports:
import 'package:loading_animation_widget/loading_animation_widget.dart';

// Project imports:

class Loader extends StatelessWidget {
  final Color? color;
  final double size;

  const Loader({
    Key? key,
    this.color,
    this.size = 30,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.horizontalRotatingDots(
        color: color ?? Theme.of(context).colorScheme.onBackground,
        size: size,
      ),
    );
  }
}
