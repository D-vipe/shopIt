import 'package:flutter/material.dart';
import 'package:shop_it/app/theme/text_styles.dart';
import 'package:shop_it/ui/uikit/custom_input.dart';
import 'package:shop_it/ui/uikit/custom_password_input.dart';

class InputBlock extends StatelessWidget {
  final String label;
  final String errorMessage;
  final bool isPassword;
  final bool isError;
  final TextEditingController controller;
  final Function resetError;
  final bool isProcessing;

  const InputBlock({
    Key? key,
    required this.label,
    required this.isError,
    required this.isPassword,
    required this.errorMessage,
    required this.controller,
    required this.resetError,
    required this.isProcessing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AnimatedOpacity(
          opacity: isError ? 1 : 0,
          duration: const Duration(milliseconds: 800),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 3.0),
            child: Text(
              errorMessage,
              style: AppTextStyle.secondary12W400.apply(color: Theme.of(context).colorScheme.error),
            ),
          ),
        ),
        isPassword
            ? CustomPasswordInput(
                label: label,
                isInvalid: isError,
                resetError: resetError,
                maxLines: 1,
                controller: controller,
                isProcessing: isProcessing,
              )
            : CustomInput(
                controller: controller,
                label: label,
                maxLines: 1,
                isInvalid: isError,
                resetError: resetError,
                isProcessing: isProcessing,
              )
      ],
    );
  }
}
