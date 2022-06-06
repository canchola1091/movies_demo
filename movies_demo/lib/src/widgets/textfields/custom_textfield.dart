
import 'package:flutter/material.dart';
import 'package:movies_demo/src/theme/theme.dart' as th;

class CustomTextField extends StatelessWidget {

  final String textLabel;
  final String textHint;
  final double borderField;
  final bool hideText;
  final bool hasBorder;
  final bool hasError;
  final TextInputType typeKeyboard;
  final TextCapitalization capitalization;
  final TextEditingController fieldController;
  final IconData? iconPrefix;
  final Widget? iconSuffix;
  final int? maxCaracteres;
  final TextAlign txtAlign;
  final String? Function(String?)? validation;
  final void Function()? onClick;
  final void Function(String)? onChanged;

  const CustomTextField({
    Key? key,
    required this.textLabel,
    this.textHint       = '',
    this.borderField    = 5.0,
    this.hideText       = false,
    this.hasBorder      = true,
    this.hasError       = false,
    this.typeKeyboard   = TextInputType.text,
    this.capitalization = TextCapitalization.none,
    required this.fieldController,
    this.iconPrefix,
    this.iconSuffix,
    this.maxCaracteres,
    this.txtAlign = TextAlign.left,
    this.validation,
    this.onClick,
    this.onChanged
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: typeKeyboard,
      textCapitalization: capitalization,
      obscureText: hideText,
      controller: fieldController,
      validator: validation,
      cursorColor: th.primaryColor,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderField),
          borderSide: BorderSide(color: th.primaryColor, width: 2.0),
        ),
        enabledBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderField),
          borderSide: BorderSide(
            color: (hasBorder)
            ? (hasError) ? th.errorColor : th.subTitleColor
            : Colors.transparent,
            width: (hasError) ? 2.0 : 1.0
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderField),
          borderSide: BorderSide(color: (hasBorder) ? th.subTitleColor.withOpacity(0.25) : Colors.transparent, width: 2.0)
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderField),
          borderSide: BorderSide(color: (hasBorder) ? th.errorColor : Colors.transparent, width: 2.0)
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderField),
          borderSide: BorderSide(
            color: (hasBorder)
            ? (hasError) ? th.errorColor : th.primaryColor
            : Colors.transparent, width: 2.0
          ),
        ),
        filled: true,
        fillColor: Colors.white,
        labelText: textLabel,
        labelStyle: TextStyle(
          fontFamily: 'Monserrat-Regular',
          color: (hasError) ? th.errorColor : null
        ),
        errorStyle:  TextStyle(
          fontFamily: 'Monserrat-Regular',
          color: th.errorColor
        ),
        errorMaxLines: 3,
        hintText: textHint,
        hintStyle: TextStyle(
          color: th.subTitleColor,
          fontWeight: FontWeight.w500
        ),
        prefixIcon: (iconPrefix != null)
        ? Icon(iconPrefix, color: th.secondaryColor)
        : null,
        suffixIcon: iconSuffix,
        counterStyle: const TextStyle(
          fontSize: 11.0,
          color: Colors.grey
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always
      ),
      maxLength: maxCaracteres,
      textAlign: txtAlign,
      onChanged: onChanged,
      style: TextStyle( color: th.subTitleColor )
    );
  }
}