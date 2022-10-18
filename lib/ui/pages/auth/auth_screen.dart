import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:shop_it/app/enums/carousel_action_type.dart';
import 'package:shop_it/ui/pages/auth/components/header_title_image.dart';
import 'package:shop_it/ui/pages/auth/forms/auth_form.dart';
import 'package:shop_it/ui/pages/auth/forms/reg_form.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late CarouselSliderController _controller;

  @override
  void initState() {
    super.initState();
    _controller = CarouselSliderController();
  }

  void handleCarousel({required CarouselAction type}) {
    switch (type) {
      case CarouselAction.prev:
        _controller.previousPage(const Duration(milliseconds: 700));
        break;
      case CarouselAction.next:
        _controller.nextPage(const Duration(milliseconds: 700));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final double _screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: SafeArea(
          top: true,
          bottom: false,
          child: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    color: Theme.of(context).colorScheme.background,
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: SizedBox(
                        height: _screenHeight,
                        child: CarouselSlider(
                          controller: _controller,
                          scrollPhysics: const NeverScrollableScrollPhysics(),
                          slideTransform: const CubeTransform(),
                          children: [
                            Column(
                              children: [
                                const HeaderTitleImage(),
                                SizedBox(
                                  height: _screenHeight - 220.0,
                                  child: AuthForm(changeForm: handleCarousel),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                const HeaderTitleImage(),
                                SizedBox(
                                  height: _screenHeight - 220.0,
                                  child: RegForm(changeForm: handleCarousel),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
