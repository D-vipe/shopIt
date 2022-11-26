import 'package:flutter/material.dart';
import 'package:shop_it/app/constants/app_colors.dart';
import 'package:shop_it/ui/uikit/loader.dart';

class AppRoundedButton extends StatelessWidget {
  final Function handler;
  final Color color;
  final TextStyle labelStyle;
  final String label;
  final bool isProcessing;
  final Color? loaderColor;
  const AppRoundedButton({
    Key? key,
    required this.color,
    required this.labelStyle,
    required this.label,
    required this.handler,
    required this.isProcessing,
    this.loaderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44.0,
      width: MediaQuery.of(context).size.width,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: color,
        ),
        onPressed: () => handler(),
        child: isProcessing
            ? Loader(
                color: loaderColor ?? Theme.of(context).colorScheme.onBackground,
              )
            : Text(
                label,
                style: labelStyle,
              ),
      ),
    );
  }
}
