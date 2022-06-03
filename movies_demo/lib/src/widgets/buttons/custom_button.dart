
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_demo/src/theme/theme.dart' as th;
import 'package:movies_demo/src/utils/utils.dart' as utils;

class CustomButton extends StatelessWidget {
  final Widget childWidget;
  final double height;
  final double? width;
  final Color? bgColor;
  final Color? splashColor;
  final double elevation;
  final double borderRadius;
  final double padVertical;
  final double padHorizontal;
  final Color borderColor;
  final Function? btnFunction;

  CustomButton({
    required this.childWidget,
    this.height = 40.0,
    this.width,
    this.bgColor,
    this.splashColor,
    this.elevation = 5.0,
    this.borderRadius = 5.0,
    this.borderColor = Colors.transparent,
    this.padVertical = 0.0,
    this.padHorizontal = 0.0,
    required this.btnFunction
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (width == null) ? null : utils.porcientoW(Get.context, width!),
      child: MaterialButton(
        padding: EdgeInsets.symmetric(
          vertical: padVertical,
          horizontal: padHorizontal
        ),
        disabledColor: Colors.grey.withOpacity(0.9),
        height: height,
        color: (bgColor != null)
        ? bgColor : Colors.transparent,
        elevation: elevation,
        highlightElevation: (bgColor != null) ? 10.0 : 0.0,
        highlightColor: Colors.transparent,
        splashColor: (splashColor != null)
        ? splashColor!.withOpacity(0.5)
        : th.secondaryColor.withOpacity(0.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          side: BorderSide(color: borderColor)
        ),
        child: Center(child: childWidget),
        onPressed: btnFunction!()
      )
    );
  }

  
}