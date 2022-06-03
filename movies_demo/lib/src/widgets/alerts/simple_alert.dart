
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:movies_demo/src/theme/theme.dart' as th;
import 'package:movies_demo/src/utils/utils.dart' as utils;
import 'package:movies_demo/src/widgets/buttons/custom_button.dart';
import 'package:movies_demo/src/widgets/text/custom_text.dart';

class SimpleAlert {

  void cAlert(String? _txtAlert, [bool _isDismissible = false, Function? fnButonAlert,  Widget? _customWidget, bool withTimer = false]) {
    Get.dialog(
      AlertDialog(
        scrollable: true,
        insetPadding: EdgeInsets.zero,
        contentPadding: const EdgeInsets.all(0.0),
        backgroundColor: Colors.transparent,
        content: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.0)
          ),
          padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 20.0),
          width: utils.porcientoW(Get.context, 70),
          child: (_customWidget == null) ? Column(
            children: [
              _cTxtWidget(_txtAlert!),
              const SizedBox(height: 25.0),
              _cButtonAceptar(_txtAlert, fnButonAlert),
            ]
          ) : _customWidget
        )
      ),
      barrierDismissible: _isDismissible
    );
  }

  Widget _cTxtWidget(String _txtAlert) {
    bool _isRichText = false;
    String _txtTitle = '';
    String _txtSubTitle = '';
    if (_txtAlert.contains('¡Lo sentimos!')) {
      _isRichText = true;
      _txtTitle = '¡Lo sentimos!';
      _txtSubTitle = _txtAlert.replaceAll(_txtTitle, '');
    } else if (_txtAlert.contains('We are sorry!')) {
      _isRichText = true;
      _txtTitle = 'We are sorry!';
      _txtSubTitle = _txtAlert.replaceAll(_txtTitle, '');
    }
    return (_isRichText)
    ? RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: _txtTitle,
        style: TextStyle(
          fontSize: 16.0,
          fontFamily: 'Monserrat-Regular',
          color: th.errorColor
        ),
        children: <TextSpan>[
          TextSpan(
            text: _txtSubTitle,
            style: TextStyle(
              fontSize: 16.0,
              fontFamily: 'Monserrat-Regular',
              color: th.subTitleColor
            )
          )
        ]
      )
    )
    : CustomText(
      fTxt: _txtAlert, 
      fAlign: TextAlign.center,
      fSize: 16.0,
      fColor: th.subTitleColor,
    );
  }

  Widget _cButtonAceptar(String _txtAlert, Function? fnButonAlert) {
    return CustomButton(
      width: 40.0,
      borderRadius: 5.0,
      bgColor: th.secondaryColor,
      splashColor: th.primaryColor,
      childWidget: const FittedBox(
        child: CustomText(
          fTxt: 'ACEPTAR',
          fSize: 14.0,
          fColor: Colors.white
        )
      ),
      btnFunction: () {
        if (fnButonAlert != null) {
          fnButonAlert();
        }
        Get.back();
      }
    );
  }

}