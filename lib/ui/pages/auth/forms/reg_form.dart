import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:shop_it/app/constants/app_colors.dart';
import 'package:shop_it/app/constants/app_dictionary.dart';
import 'package:shop_it/app/constants/errors_const.dart';
import 'package:shop_it/app/theme/text_styles.dart';
import 'package:shop_it/app/enums/carousel_action_type.dart';
import 'package:shop_it/redux/actions/reg_actions.dart';
import 'package:shop_it/redux/app_state.dart';
import 'package:shop_it/redux/view_model/reg_view_model.dart';
import 'package:shop_it/services/snackbar_service.dart';
import 'package:shop_it/ui/pages/auth/components/input_block.dart';
import 'package:shop_it/ui/uikit/rounded_button.dart';
import 'package:shop_it/ui/uikit/text_formatters/phone_format.dart';

class RegForm extends StatefulWidget {
  final Function changeForm;
  const RegForm({Key? key, required this.changeForm}) : super(key: key);

  @override
  State<RegForm> createState() => _RegFormState();
}

class _RegFormState extends State<RegForm> {
  final _formKey = GlobalKey<FormState>();
  MaskTextInputFormatter formatter = phoneFormatter();
  late TextEditingController loginController;
  late TextEditingController passwordController;
  late TextEditingController passwordRepeatController;

  @override
  void initState() {
    super.initState();
    loginController = TextEditingController();
    passwordController = TextEditingController();
    passwordRepeatController = TextEditingController();
  }

  void resetPhoneError() {
    StoreProvider.of<AppState>(context).dispatch(ResetPhoneError());
  }

  void resetPasswordError() {
    StoreProvider.of<AppState>(context).dispatch(ResetPasswordError());
  }

  void sendFormHandler() {
    FocusManager.instance.primaryFocus?.unfocus();
    StoreProvider.of<AppState>(context).dispatch(CheckRegCredentials(
      login: '7${formatter.getUnmaskedText()}',
      password: passwordController.text,
      repeatPassword: passwordRepeatController.text,
    ));
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
    return StoreConnector<AppState, RegViewModel>(
      converter: (store) => store.state.regFormState,
      distinct: true,
      onDidChange: (_, state) {
        if (state.regSuccess == true) {
          debugPrint('YOUHOOOO! NAVIGATE TO MAIN SCREEN');
        }
        if (state.regSuccess == false && state.errorMessage != null) {
          SnackbarService.showErrorMessage(context: context, message: state.errorMessage ?? GeneralErrors.generalError);
        }
      },
      builder: (_, RegViewModel state) {
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
                      height: 250.0,
                    ),
                    AnimatedPositioned(
                      top: MediaQuery.of(context).viewInsets.bottom > 0 ? 0 : 0,
                      left: 0,
                      duration: const Duration(milliseconds: 150),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width - 40, // margin x 2 + padding x 2
                        height: 250.0,
                        // decoration: AppDecorations.boxShadowDecoration,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InputBlock(
                                isPhone: true,
                                formatter: formatter,
                                isPassword: false,
                                label: AppDictionary.phoneLabel,
                                controller: loginController,
                                errorMessage: state.loginMessage ?? '',
                                isError: state.isLoginValid == false,
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
                            InputBlock(
                                isPassword: true,
                                label: AppDictionary.authPasswordRepeatLabel,
                                controller: passwordRepeatController,
                                errorMessage: '',
                                isError: state.isPasswordValid == false,
                                resetError: resetPasswordError,
                                isProcessing: state.isProcessing),
                            const SizedBox(height: 19.5),
                            AppRoundedButton(
                              label: AppDictionary.authRegBtn,
                              isProcessing: state.isProcessing,
                              color: AppColors.red,
                              labelStyle: AppTextStyle.main18W600.apply(color: AppColors.white),
                              loaderColor: AppColors.white,
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
                    onPressed: () => widget.changeForm(type: CarouselAction.prev),
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
      },
    );
  }
}
