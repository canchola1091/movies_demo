
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:movies_demo/src/theme/theme.dart' as th;
import 'package:movies_demo/src/utils/utils.dart' as utils;
import 'package:movies_demo/src/widgets/buttons/custom_button.dart';
import 'package:movies_demo/src/widgets/text/custom_text.dart';

class SimpleAlert {

  void cAlert(String title, String message) {
    Get.dialog(
      FlipInX(
        child: AlertDialog(
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
            child: Column(
              children: [
               CustomText( // TITLTE
                fTxt: title, 
                fSize: 16.0, 
                fAlign: TextAlign.center,
                fColor: th.subTitleColor,
              ),
              const SizedBox(height: 15.0),
              CustomText( // MESSAGE
                fTxt: message, 
                fSize: 16.0, 
                fAlign: TextAlign.center,
                fColor: th.subTitleColor,
              ),
              const SizedBox(height: 25.0),
                CustomButton( // BUTTON
                  width: 40.0,
                  borderRadius: 5.0,
                  bgColor: th.primaryColor,
                  splashColor: th.secondaryColor,
                  childWidget: const FittedBox(
                  child: CustomText(
                      fTxt: 'ACEPTAR',
                      fSize: 14.0,
                      fColor: Colors.white
                    )
                  ),
                  btnFunction: () => Get.back()
                )
              ]
            )
          )
        ),
      ),
      barrierDismissible: false
    );
  }

}