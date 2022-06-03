

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:movies_demo/src/controllers/login_controller.dart';
import 'package:movies_demo/src/widgets/buttons/custom_button.dart';
import 'package:movies_demo/src/widgets/text/custom_text.dart';
import 'package:movies_demo/src/widgets/textfields/custom_textfield.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (_) => GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextField(textLabel: 'Email', fieldController: _.gxEmailCtrl),
                const SizedBox(height: 40.0),
                CustomTextField(textLabel: 'Password', fieldController: _.gxPassWordCtrl),
                const SizedBox(height: 40.0),
                Center(
                  child: CustomButton(
                    width: 20.0,
                    height: 100.0,
                    bgColor: Colors.orange,
                    splashColor: Colors.green,
                    childWidget: const CustomText(
                      fTxt: 'INICIAR SESIÓN',
                      fSize: 16.0,
                    ),
                     btnFunction: _.fnLogin
                )
                   )
              ]
            )
          )
         )
      )
    );
  }
}