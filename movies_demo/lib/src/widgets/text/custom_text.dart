
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {

  final String fTxt;
  final double fSize;
  final String fFamily;
  final Color? fColor;
  final String? fWeight;
  final TextAlign fAlign;
  final int? fMaxLines;
  final FontStyle fFontStyle;
  final TextDecoration txtLine;
  final double spacingLetter;

  const CustomText({
    Key? key,
    required this.fTxt,
    required this.fSize,
    this.fFamily = 'Monserrat-Medium',
    this.fColor,
    this.fWeight,
    this.fAlign = TextAlign.left,
    this.fMaxLines,
    this.fFontStyle = FontStyle.normal,
    this.txtLine = TextDecoration.none,
    this.spacingLetter = 0.0
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      fTxt,
      textAlign: fAlign,
      maxLines: fMaxLines,
      overflow: (fMaxLines == null) ? null : TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: fSize,
        fontFamily: fFamily,
        color: fColor,
        fontWeight: (fWeight == null) ? null
        : getFontWeight(fWeight!),
        fontStyle: fFontStyle,
        decoration: txtLine,
        letterSpacing: spacingLetter
      )
    );
  }

  FontWeight getFontWeight(String _weight) {
    switch (_weight) {
      case 'Thin':
        return FontWeight.w100;
      case 'ExtraLight':
        return FontWeight.w200;
      case 'Light':
        return FontWeight.w300;
      case 'Regular':
        return FontWeight.w400;
      case 'Medium':
        return FontWeight.w500;
      case 'SemiBold':
        return FontWeight.w600;
      case 'Bold':
        return FontWeight.w700;
      case 'ExtraBold':
        return FontWeight.w800;
      case 'Black':
        return FontWeight.w900;
      default:
        return FontWeight.w900;
    }
  }

}