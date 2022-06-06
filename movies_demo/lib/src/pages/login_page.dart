
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_demo/src/controllers/login_controller.dart';
import 'package:movies_demo/src/validations/validations.dart';
import 'package:movies_demo/src/widgets/buttons/custom_button.dart';
import 'package:movies_demo/src/widgets/text/custom_text.dart';
import 'package:movies_demo/src/widgets/textfields/custom_textfield.dart';
import 'package:movies_demo/src/utils/utils.dart' as utils;
import 'package:movies_demo/src/theme/theme.dart' as th;


class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: SafeArea(
            child: _body()
          )
         )
      );
  }

  Widget _body() {
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (_) => SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: FadeInUp(
          from: 20.0,
          delay: const Duration(milliseconds: 400),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: utils.porcientoH(Get.context, 20.0)),
                _titleText(),
                SizedBox(height: utils.porcientoH(Get.context, 7.0)),
                _form(),
                SizedBox(height: utils.porcientoH(Get.context, 10.0)),
                _butonLogin(_.fnLogin)
              ],
            ),
          ),
        )
      ),
    );
  }

  Widget _titleText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CustomText(
          fTxt: 'Sign In', 
          fSize: 45.0,
          fColor: Colors.black,
        ),
        const SizedBox(width: 7.0),
        FlutterLogo(
          size: utils.porcientoW(Get.context, 10.0),
        )
      ]
    );
  }
  
  Widget _form() {
    return GetBuilder<LoginController>(
      id: 'form',
      builder: (_) => Form(
        key: _.gxloginFormKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextField(
                textLabel: 'Email',
                fieldController: _.gxEmailCtrl,
                typeKeyboard: TextInputType.emailAddress,
                validation: (_val) => Validations.validEmail(_val!)
              ),
              const SizedBox(height: 30.0),
              CustomTextField(
                textLabel: 'Password', 
                fieldController: _.gxPassWordCtrl,
                hideText: _.gxHidePass,
                iconSuffix: IconButton(
                  icon: Icon(
                    (_.gxHidePass)
                    ? Icons.visibility
                    : Icons.visibility_off,
                    color: Colors.grey
                  ),
                  onPressed: _.fnHidePass
                ),
                validation: (_val) => Validations.validRequiredAndLength(_val, 6),
              )
            ]
          )
        )
      ),
    );
  }

  Widget _butonLogin(void Function() _fnLogIn) {
    return CustomButton(
      width: utils.porcientoW(Get.context, 15.0),
      height: utils.porcientoH(Get.context, 5.0),
      bgColor: th.primaryColor,
      splashColor: th.secondaryColor,
      childWidget: const CustomText(
        fTxt: 'INICIAR SESIÓN',
        fSize: 16.0,
      ),
       btnFunction: _fnLogIn
    );
  }

}