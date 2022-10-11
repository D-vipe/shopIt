// Flutter imports:
import 'package:flutter/material.dart';
import 'package:shop_it/app/constants/app_colors.dart';
import 'package:shop_it/app/theme/text_styles.dart';

class CustomInput extends StatelessWidget {
  final String label;
  final int maxLines;
  final TextEditingController controller;
  final bool isInvalid;
  final bool isProcessing;
  final Function? resetError;

  const CustomInput({
    Key? key,
    required this.label,
    required this.maxLines,
    required this.controller,
    required this.isInvalid,
    required this.isProcessing,
    this.resetError,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: !isProcessing,
      maxLines: maxLines,
      controller: controller,
      showCursor: true,
      cursorColor: Theme.of(context).colorScheme.onBackground,
      onTap: () => resetError != null ? resetError!.call() : null,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 21, vertical: 10),
        labelText: label,
        labelStyle: AppTextStyle.main18W400,
        floatingLabelStyle: AppTextStyle.main14W400.apply(color: Theme.of(context).colorScheme.onBackground),
        border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
            borderSide: isInvalid
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
    );
  }
}
