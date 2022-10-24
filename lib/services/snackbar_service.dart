import 'package:flutter/material.dart';
import 'package:shop_it/app/theme/text_styles.dart';

class SnackbarService {
  static void showErrorMessage({required BuildContext context, required String message}) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: SizedBox(
        height: 20,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              message,
              style: AppTextStyle.secondary14W400,
            ),
          ],
        ),
      ),
      duration: const Duration(seconds: 3), // by timeout time?
    ));
  }
}
