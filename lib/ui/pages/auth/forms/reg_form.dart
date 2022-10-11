import 'package:flutter/material.dart';
import 'package:shop_it/app/constants/app_colors.dart';
import 'package:shop_it/app/constants/app_dictionary.dart';
import 'package:shop_it/app/theme/text_styles.dart';
import 'package:shop_it/ui/enums/form_type.dart';
import 'package:shop_it/ui/pages/auth/components/input_block.dart';
import 'package:shop_it/ui/uikit/rounded_button.dart';

class RegForm extends StatefulWidget {
  final Function changeForm;
  const RegForm({Key? key, required this.changeForm}) : super(key: key);

  @override
  State<RegForm> createState() => _RegFormState();
}

class _RegFormState extends State<RegForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController loginController;
  late TextEditingController passwordController;
  late TextEditingController passwordRepeatController;
  late bool loginHasError;
  late bool passwordHasError;
  bool obscureText = true;
  bool processForm = false;
  String loginErrorText = '';
  String passwordErrorText = '';

  @override
  void initState() {
    super.initState();
    loginController = TextEditingController();
    passwordController = TextEditingController();
    passwordRepeatController = TextEditingController();
    loginHasError = false;
    passwordHasError = false;
  }

  bool _customValidation() {
    bool isLoginValid = false;
    bool isPasswordValid = false;

    // first check email field
    isLoginValid = loginController.text != '';
    isPasswordValid = passwordController.text != '';

    if (isLoginValid && isPasswordValid) {
      return true;
    } else {
      // make different conditions not to call set state multiple times
      if (isLoginValid == false && isPasswordValid) {
        setState(() {
          loginHasError = true;
          passwordHasError = false;
          loginErrorText = AppDictionary.fillInput;
          passwordErrorText = '';
        });
      } else if (isLoginValid && isPasswordValid == false) {
        setState(() {
          loginHasError = false;
          passwordHasError = true;
          loginErrorText = '';
          passwordErrorText = AppDictionary.fillInput;
        });
      } else {
        setState(() {
          loginHasError = true;
          passwordHasError = true;
          loginErrorText = AppDictionary.fillInput;
          passwordErrorText = AppDictionary.fillInput;
        });
      }

      return false;
    }
  }

  void resetEmailError() {
    setState(() {
      loginHasError = false;
      loginErrorText = '';
    });
  }

  void resetPasswordError() {
    setState(() {
      passwordHasError = false;
      passwordErrorText = '';
    });
  }

  void sendFormHandler() {
    FocusManager.instance.primaryFocus?.unfocus();
    setState(() {
      // implicitly clear all active errors
      loginHasError = false;
      loginErrorText = '';
      passwordHasError = false;
      passwordErrorText = '';
      processForm = true;
    });
    if (_customValidation()) {
      // StoreProvider.of<AppState>(context).dispatch(CheckAuthCredentials(login: loginController.text, password: passwordController.text));
    } else {
      setState(() => processForm = false);
    }
  }

  @override
  void dispose() {
    loginController.dispose();
    passwordController.dispose();
    passwordRepeatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: Column(
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
                            isPassword: false,
                            label: AppDictionary.authLoginLabel,
                            controller: loginController,
                            errorMessage: loginErrorText,
                            isError: loginHasError,
                            resetError: resetEmailError,
                            isProcessing: processForm),
                        InputBlock(
                            isPassword: true,
                            label: AppDictionary.authPasswordLabel,
                            controller: passwordController,
                            errorMessage: passwordErrorText,
                            isError: passwordHasError,
                            resetError: resetPasswordError,
                            isProcessing: processForm),
                        InputBlock(
                            isPassword: true,
                            label: AppDictionary.authPasswordRepeatLabel,
                            controller: passwordController,
                            errorMessage: passwordErrorText,
                            isError: passwordHasError,
                            resetError: resetPasswordError,
                            isProcessing: processForm),
                        const SizedBox(height: 19.5),
                        AppRoundedButton(
                          label: AppDictionary.authLoginBtn,
                          isProcessing: processForm,
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
                onPressed: () => widget.changeForm(type: FormType.auth),
                child: Text(
                  AppDictionary.toAuthForm,
                  style: AppTextStyle.main18W400.apply(color: Theme.of(context).colorScheme.primary),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
