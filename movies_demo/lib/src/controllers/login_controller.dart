
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:movies_demo/src/utils/utils.dart' as utils;


class LoginController extends GetxController {

  final TextEditingController _emailCtrl    = TextEditingController(text: 'canchola700@gmail.com');
  final TextEditingController _passWordCtrl = TextEditingController(text: '123456');
  final GlobalKey<FormState> _loginFormkey  = GlobalKey<FormState>();

  //? GETTERS
  TextEditingController get gxEmailCtrl    => _emailCtrl;
  TextEditingController get gxPassWordCtrl => _passWordCtrl;
  GlobalKey<FormState> get gxloginFormKey  => _loginFormkey;

  @override
  void onClose() {
    _emailCtrl.dispose();
    _passWordCtrl.dispose();
    super.onClose();
  }

  Future<void> fnLogin() async{
    utils.msginfo('Iniciando Sesión...');
    utils.cLoading();
    try {
      final UserCredential user = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailCtrl.text.trim(),
      password: _passWordCtrl.text.trim()
    );
    if(user.user!.email != null) {
      Get.offAllNamed('/movies_page');
    } else {
      print('--> USUARIO NO REGISTRADO');
    }
    } catch (e) {
      print('--> OCURRIO UN ERROR: $e');
    }
    Get.back();
    
  }
  
}