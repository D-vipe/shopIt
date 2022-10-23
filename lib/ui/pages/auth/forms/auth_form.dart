import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:shop_it/app/constants/app_colors.dart';
import 'package:shop_it/app/constants/app_dictionary.dart';
import 'package:shop_it/app/theme/text_styles.dart';
import 'package:shop_it/app/enums/carousel_action_type.dart';
import 'package:shop_it/redux/actions/auth_actions.dart';
import 'package:shop_it/redux/app_state.dart';
import 'package:shop_it/redux/view_model/auth_view_model.dart';
import 'package:shop_it/ui/pages/auth/components/input_block.dart';
import 'package:shop_it/ui/uikit/rounded_button.dart';

class AuthForm extends StatefulWidget {
  final Function changeForm;
  const AuthForm({Key? key, required this.changeForm}) : super(key: key);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController loginController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    loginController = TextEditingController();
    passwordController = TextEditingController();
  }

  // bool _customValidation() {
  //   bool isLoginValid = false;
  //   bool isPasswordValid = false;
  //
  //   // first check email field
  //   isLoginValid = loginController.text != '';
  //   isPasswordValid = passwordController.text != '';
  //
  //   if (isLoginValid && isPasswordValid) {
  //     return true;
  //   } else {
  //     // make different conditions not to call set state multiple times
  //     if (isLoginValid == false && isPasswordValid) {
  //       setState(() {
  //         loginHasError = true;
  //         passwordHasError = false;
  //         loginErrorText = AppDictionary.fillInput;
  //         passwordErrorText = '';
  //       });
  //     } else if (isLoginValid && isPasswordValid == false) {
  //       setState(() {
  //         loginHasError = false;
  //         passwordHasError = true;
  //         loginErrorText = '';
  //         passwordErrorText = AppDictionary.fillInput;
  //       });
  //     } else {
  //       setState(() {
  //         loginHasError = true;
  //         passwordHasError = true;
  //         loginErrorText = AppDictionary.fillInput;
  //         passwordErrorText = AppDictionary.fillInput;
  //       });
  //     }
  //
  //     return false;
  //   }
  // }

  void resetPhoneError() {
    StoreProvider.of<AppState>(context).dispatch(ResetPhoneError());
  }

  void resetPasswordError() {
    StoreProvider.of<AppState>(context).dispatch(ResetPasswordError());
  }

  void sendFormHandler() {
    FocusManager.instance.primaryFocus?.unfocus();
    StoreProvider.of<AppState>(context).dispatch(CheckAuthCredentials(login: loginController.text, password: passwordController.text));
  }

  @override
  void dispose() {
    loginController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AuthViewModel>(
        converter: (store) => store.state.authFormState,
        distinct: true,
        builder: (_, AuthViewModel state) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 5.0),
            elevation: 5.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Form(
                    key: _formKey,
                    child: Stack(clipBehavior: Clip.none, children: [
                      Container(
                        height: 240.0,
                      ),
                      AnimatedPositioned(
                        // top: MediaQuery.of(context).viewInsets.bottom > 0 ? -80 : 0,
                        top: MediaQuery.of(context).viewInsets.bottom > 0 ? 0 : 0,
                        left: 0,
                        duration: const Duration(milliseconds: 150),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width - 40, // margin x 2 + padding x 2
                          height: 240.0,
                          // decoration: AppDecorations.boxShadowDecoration,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InputBlock(
                                  isPhone: true,
                                  isPassword: false,
                                  label: AppDictionary.phoneLabel,
                                  controller: loginController,
                                  errorMessage: state.phoneMessage ?? '',
                                  isError: state.isPhoneValid == false,
                                  resetError: resetPhoneError,
                                  isProcessing: state.isProcessing),
                              InputBlock(
                                  isPassword: true,
                                  label: AppDictionary.authPasswordLabel,
                                  controller: passwordController,
                                  errorMessage: state.passwordMessage ?? '',
                                  isError: state.isPasswordValid == false,
                                  resetError: resetPasswordError,
                                  isProcessing: state.isProcessing),
                              const SizedBox(height: 19.5),
                              AppRoundedButton(
                                label: AppDictionary.authLoginBtn,
                                isProcessing: state.isProcessing,
                                color: AppColors.red,
                                labelStyle: AppTextStyle.main18W600.apply(color: AppColors.white),
                                handler: sendFormHandler,
                              )
                            ],
                          ),
                        ),
                      )
                    ]),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () => widget.changeForm(type: CarouselAction.next),
                      child: Text(
                        AppDictionary.toRegForm,
                        style: AppTextStyle.main18W400.apply(color: Theme.of(context).colorScheme.primary),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
