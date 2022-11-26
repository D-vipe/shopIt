import 'package:flutter/material.dart';
import 'package:shop_it/app/constants/app_colors.dart';
import 'package:shop_it/resources/resources.dart';

class HeaderTitleImage extends StatelessWidget {
  const HeaderTitleImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      // color: AppColors.dark,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(
        top: 25.0,
      ),
      child: Image.asset(
        AppIcons.appIcon,
        fit: BoxFit.cover,
      ),
    );
  }
}
