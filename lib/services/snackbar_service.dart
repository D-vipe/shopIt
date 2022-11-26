import 'package:flutter/material.dart';
import 'package:shop_it/app/constants/app_colors.dart';
import 'package:shop_it/app/theme/text_styles.dart';

class SnackbarService {
  static void showErrorMessage({required BuildContext context, required String message}) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width - 48,
              child: Text(
                message,
                style: AppTextStyle.secondary14W400,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
      duration: const Duration(seconds: 3), // by timeout time?
    ));
  }
}
