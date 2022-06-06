
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:movies_demo/src/theme/theme.dart' as th;
import 'package:movies_demo/src/utils/utils.dart' as utils;
import 'package:movies_demo/src/widgets/buttons/custom_button.dart';
import 'package:movies_demo/src/widgets/text/custom_text.dart';


class AlertLogOut extends StatelessWidget {

  final void Function() fnDone;   // Fucnión para botón de 'ACEPTAR'
  final void Function() fnCancel; // Función para botón de 'ATRAS/CANCELAR'

  const AlertLogOut({
    Key? key,
    required this.fnDone,
    required this.fnCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlipInX(
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
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomText(
                  fTxt: '¿Cerrar sesión?',
                  fSize: 18.0,
                  fColor: th.primaryColor,
                ),
                const SizedBox(height: 25.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomButton(
                      width: utils.porcientoW(Get.context, 6.0),
                      bgColor: Colors.white,
                      borderColor: th.primaryColor,
                      childWidget: CustomText(
                        fTxt: 'ATRÁS',
                        fSize: 15.0,
                        fColor: th.primaryColor,
                      ), 
                      btnFunction: fnCancel
                    ),
                    CustomButton(
                      width: utils.porcientoW(Get.context, 6.0),
                      bgColor: th.primaryColor,
                      childWidget: const CustomText(
                        fTxt: 'ACEPTAR',
                        fSize: 15.0), 
                      btnFunction: fnDone
                    ),
                  ]
                )
              ]
            )
          ) 
        )
      ),
    );
  }
}

