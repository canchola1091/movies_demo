
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies_demo/src/theme/theme.dart' as th;

class CTextField extends StatelessWidget {

  final String textLabel;
  final String textHint;
  final double borderField;
  final bool hideText;
  final bool isEnabled;
  final bool isOnclick;
  final bool hasBorder;
  final bool hasError;
  final bool hasCounter;
  final TextInputType typeKeyboard;
  final TextCapitalization capitalization;
  final FocusNode? fieldNode;
  final TextEditingController fieldController;
  final IconData? iconPrefix;
  final Widget? iconSuffix;
  final bool isExpanded;
  final bool containsFormat;
  final int? maxCaracteres;
  final TextAlign txtAlign;
  final String? Function(String?)? validation;
  final void Function()? onClick;
  final void Function(String)? onChanged;

  CTextField({
    required this.textLabel,
    this.textHint = '',
    this.borderField = 5.0,
    this.hideText = false,
    this.isEnabled = true,
    this.isOnclick = false,
    this.hasBorder = true,
    this.hasError = false,
    this.hasCounter = false,
    this.typeKeyboard = TextInputType.text,
    this.capitalization = TextCapitalization.none,
    this.fieldNode,
    required this.fieldController,
    this.iconPrefix,
    this.iconSuffix,
    this.isExpanded = false,
    this.containsFormat = false,
    this.maxCaracteres,
    this.txtAlign = TextAlign.left,
    this.validation,
    this.onClick,
    this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: (!this.containsFormat)
      ? []
      : [
        FilteringTextInputFormatter.deny(RegExp('[a-zA-Z]')),
        LengthLimitingTextInputFormatter(this.maxCaracteres),
      ],
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: this.typeKeyboard,
      textCapitalization: this.capitalization,
      obscureText: this.hideText,
      focusNode: fieldNode,
      controller: this.fieldController,
      validator: this.validation,
      enabled: this.isEnabled,
      readOnly: (this.isOnclick) ? true : false,
      onTap: () {
        if (this.isOnclick) this.onClick!();
      },
      cursorColor: th.primaryColor,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(this.borderField),
          borderSide: BorderSide(color: th.primaryColor, width: 2.0),
        ),
        enabledBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(this.borderField),
          borderSide: BorderSide(
            color: (this.hasBorder)
            ? (this.hasError) ? th.errorColor : th.subTitleColor
            : Colors.transparent,
            width: (this.hasError) ? 2.0 : 1.0
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(this.borderField),
          borderSide: BorderSide(color: (this.hasBorder) ? th.subTitleColor.withOpacity(0.25) : Colors.transparent, width: 2.0)
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(this.borderField),
          borderSide: BorderSide(color: (this.hasBorder) ? th.errorColor : Colors.transparent, width: 2.0)
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(this.borderField),
          borderSide: BorderSide(
            color: (this.hasBorder)
            ? (this.hasError) ? th.errorColor : th.secondaryColor
            : Colors.transparent, width: 2.0
          ),
        ),
        filled: true,
        fillColor: Colors.white,
        labelText: this.textLabel,
        labelStyle: TextStyle(
          fontFamily: 'Monserrat-Regular',
          color: (this.hasError) ? th.errorColor : null
        ),
        errorStyle:  TextStyle(
          fontFamily: 'Monserrat-Regular',
          color: th.errorColor
        ),
        errorMaxLines: 3,
        hintText: this.textHint,
        hintStyle: TextStyle(
          color: th.subTitleColor,
          fontWeight: FontWeight.w500
        ),
        prefixIcon: (this.iconPrefix != null)
        ? Icon(this.iconPrefix, color: th.secondaryColor) : null,
        suffixIcon: this.iconSuffix,
        counterText: (this.hasCounter) ? '${this.fieldController.text.length} / ${this.maxCaracteres}' : '',
        counterStyle: TextStyle(
          fontSize: 11.0,
          color: Colors.grey
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always
      ),
      maxLength: this.maxCaracteres,
      maxLines: (this.isExpanded) ? null : 1,
      textAlign: this.txtAlign,
      onChanged: onChanged,
      style: TextStyle(
        fontFamily: 'Monserrat-Regular',
        color: th.subTitleColor
      )
    );
  }
}