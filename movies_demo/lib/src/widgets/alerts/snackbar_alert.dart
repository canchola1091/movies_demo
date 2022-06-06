
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:movies_demo/src/theme/theme.dart' as th;
import 'package:movies_demo/src/widgets/text/custom_text.dart';

class SnackBarAlert {

  static void cSnackBar(IconData _icon, String _txtSnack) {
    Get.rawSnackbar(
      backgroundColor: th.snackBarColor,
      snackStyle: SnackStyle.GROUNDED,
      messageText: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(_icon, color: Colors.white),
            const SizedBox(width: 5.0),
            Flexible(
              child: CustomText(
                fTxt: _txtSnack, 
                fSize: 13.0,
                fAlign: TextAlign.justify
              )
            )
          ]
        )
      )
    );
  }

}