// Flutter imports:
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:shop_it/app/constants/app_colors.dart';
import 'package:shop_it/app/theme/text_styles.dart';
import 'package:shop_it/ui/uikit/text_formatters/phone_format.dart';

class CustomInput extends StatelessWidget {
  final String label;
  final int maxLines;
  final TextEditingController controller;
  final bool isInvalid;
  final bool isProcessing;
  final Function? resetError;
  final bool? isPhone;
  final MaskTextInputFormatter? formatter;

  const CustomInput({
    Key? key,
    required this.label,
    required this.maxLines,
    required this.controller,
    required this.isInvalid,
    required this.isProcessing,
    this.resetError,
    this.isPhone,
    this.formatter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: !isProcessing,
      maxLines: maxLines,
      controller: controller,
      showCursor: true,
      keyboardType: isPhone == true ? TextInputType.number : null,
      inputFormatters: formatter != null ? [formatter!] : [],
      cursorColor: Theme.of(context).colorScheme.onBackground,
      onTap: () => resetError != null ? resetError!.call() : null,
      onChanged: (String value) {
        if (isPhone == true) {
          if (formatter!.getUnmaskedText() == '7') {
            value = '';
            controller.text = '';
          }
        }
      },
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
            borderSide: isInvalid ? const BorderSide(color: AppColors.red, width: 1) : BorderSide(color: Theme.of(context).colorScheme.onBackground, width: 1)),
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
