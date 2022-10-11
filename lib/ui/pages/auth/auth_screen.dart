import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:shop_it/app/constants/app_colors.dart';
import 'package:shop_it/ui/pages/auth/components/header_title_image.dart';
import 'package:shop_it/ui/pages/auth/forms/auth_form.dart';
import 'package:shop_it/ui/pages/auth/forms/reg_form.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: SafeArea(
          top: true,
          bottom: false,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: Theme.of(context).canvasColor,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                    child: Column(
                      children: [
                        const HeaderTitleImage(),
                        SizedBox(
                          height: MediaQuery.of(context).size.height - 210.0,
                          child: CarouselSlider(slideTransform: const CubeTransform(), children: const [
                            AuthForm(),
                            RegForm(),
                          ]),
                        ),
                        const SizedBox(
                          height: 35.0,
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
