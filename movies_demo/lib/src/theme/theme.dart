

import 'package:flutter/material.dart';
import 'package:movies_demo/src/utils/utils.dart' as utils;

// final ThemeData theme = ThemeData.dark().copyWith(
//   scaffoldBackgroundColor: Colors.white,
//   appBarTheme: AppBarTheme(color: primaryColor),
//   // accentColor: secondaryColor,
//   hintColor: subTitleColor,
//   disabledColor: subTitleColor,
//   unselectedWidgetColor: secondaryColor,
//   // textSelectionColor: secondaryColor.withOpacity(0.7),
//   // textSelectionHandleColor: primaryColor,
//   textSelectionTheme: TextSelectionThemeData(
//     selectionColor: secondaryColor.withOpacity(0.7),
//     selectionHandleColor: primaryColor,
//   ),
// );

// final ThemeData theme = ThemeData.dark();
final ThemeData theme = ThemeData.light();

final Color primaryColor = utils.hexToColor('#022E92');

final Color secondaryColor = utils.hexToColor('#2DAFCE');

final Color titlesColor = utils.hexToColor('#255EA9');

final Color subTitleColor = utils.hexToColor('#3A555B');

final Color errorColor = utils.hexToColor('#b00020');

final Color snackBarColor = utils.hexToColor('#1D363C').withOpacity(0.95);

final Color tutorialColor = utils.hexToColor('#108CAA').withOpacity(0.90);

// =========================== COLORES STATUS NOTIFICACIONES ===========================
final Color statusLiquidada = utils.hexToColor('#14B000');

final Color statusPendiente = utils.hexToColor('#2DAFCE');

final Color statusDevuelta = utils.hexToColor('#B00020');

// =========================== COLORES CHAT ===========================
final Color fieldChatColor = utils.hexToColor('#255EA9');

final Color agentChatColor = utils.hexToColor('#2DAFCE').withOpacity(0.20);

final Color visitorChatColor = utils.hexToColor('#255EA9').withOpacity(0.85);
