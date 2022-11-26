// Flutter imports:
import 'package:flutter/material.dart';
import 'package:shop_it/app/constants/app_colors.dart';
import 'package:shop_it/app/theme/text_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_it/resources/resources.dart';

class CustomPasswordInput extends StatefulWidget {
  final String label;
  final int maxLines;
  final TextEditingController controller;
  final bool isInvalid;
  final bool isProcessing;
  final Function? resetError;

  const CustomPasswordInput({
    Key? key,
    required this.label,
    required this.maxLines,
    required this.controller,
    required this.isInvalid,
    required this.isProcessing,
    this.resetError,
  }) : super(key: key);

  @override
  State<CustomPasswordInput> createState() => _CustomPasswordInputState();
}

class _CustomPasswordInputState extends State<CustomPasswordInput> {
  bool passwordVisible = false;

  void changeVisibility() {
    setState(() => passwordVisible = !passwordVisible);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextFormField(
          obscureText: !passwordVisible,
          enabled: !widget.isProcessing,
          enableSuggestions: false,
          maxLines: widget.maxLines,
          controller: widget.controller,
          cursorColor: Theme.of(context).colorScheme.onBackground,
          onTap: () => widget.resetError != null ? widget.resetError!.call() : null,
          decoration: InputDecoration(
            isDense: true,
            contentPadding: const EdgeInsets.only(left: 21, top: 10, bottom: 10, right: 40),
            labelText: widget.label,
            labelStyle: AppTextStyle.main18W400,
            floatingLabelStyle: AppTextStyle.main14W400.apply(color: Theme.of(context).colorScheme.onBackground),
            border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  Radius.circular(8),
                ),
                borderSide: widget.isInvalid
                    ? const BorderSide(color: AppColors.red, width: 1)
                    : BorderSide(color: Theme.of(context).colorScheme.onBackground, width: 1)),
            enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  Radius.circular(8),
                ),
                borderSide: BorderSide(color: Theme.of(context).colorScheme.onBackground, width: 1)),
            focusColor: Theme.of(context).colorScheme.primary,
            focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
              borderSide: BorderSide(color: Theme.of(context).colorScheme.onBackground, width: 2),
            ),
            errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
              borderSide: BorderSide(color: AppColors.red, width: 1),
            ),
          ),
        ),
        Positioned(
            right: 12,
            top: 8.5,
            child: GestureDetector(
              onTap: changeVisibility,
              child: SvgPicture.asset(
                passwordVisible ? AppIcons.visibilityOn : AppIcons.visibilityOff,
                width: 24,
                height: 24,
              ),
            ))
      ],
    );
  }
}
