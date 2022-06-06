
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';


const String accessToken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4NzAzZjIwMzI0YmQ4NWU4Nzg5MWZmNzg3NDgzOGIyZSIsInN1YiI6IjVkMWU2N2E3OTRkOGE4MzExNjQwMTY3NiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.dzRcIdteaT0YitIkVrxzVpUBP6ULU_BgHUZkLj4L80A'; 
const String keyApi = '8703f20324bd85e87891ff7874838b2e';

//==========================================================
/// DEVUELVE PORCIENTO DE ANCHO DE LA PANTALLA
//==========================================================
double porcientoW(BuildContext? _context, double _valor ){
  if (_context != null) {
    final size = MediaQuery.of(_context).size;
    return ((size.width/100) * _valor);
  } else {
    return 0;
  }
}

//==========================================================
/// DEVUELVE PORCIENTO DE ALTO DE LA PANTALLA
//==========================================================
double porcientoH(BuildContext? _context, double _valor ){
  if (_context != null) {
    final size = MediaQuery.of(_context).size;
    return ((size.height/100) * _valor);
  } else {
    return 0;
  }
}

//==========================================================
/// DEVUELVE COLOR EN HEXADECIMAL
//==========================================================
Color hexToColor(String _code) {
  return Color(int.parse(_code.substring(1, 7), radix: 16) + 0xFF000000);
}

//==========================================================
/// VERIFICA SI EL EMAIL ES VALIDO
//==========================================================
bool validarEmail(String _email) {
  Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = RegExp(pattern.toString());
  return (regExp.hasMatch(_email)) ? true : false;
}

//==========================================================
/// VALIDA QUE EXISTA AL MENOS UNA LETRA MAYUSCULA
//==========================================================
bool validateLetterUpperCase(String value){
  String  pattern = r'[A-Z]';
  RegExp regExp = RegExp(pattern);
  return regExp.hasMatch(value);
}

//==========================================================
/// VALIDA QUE CONTENGA AL MENOS UN NÚMERO
//==========================================================
bool validateContainsNumber(String value){
  String  pattern = r'[0-9]';
  RegExp regExp = RegExp(pattern);
  return regExp.hasMatch(value);
}

//==========================================================
/// VALIDA QUE CONTENGA SOLO NÚMEROS
//==========================================================
bool validateOnlyNumbers(String value){
  String  pattern = r'(^[0-9]{1,3}$|^[0-9]{1,3}\.[0-9]{1,2}$)';
  RegExp regExp = RegExp(pattern);
  return regExp.hasMatch(value);
}

/// Valida que contenga al menos un caracter especial
//==========================================================
/// VALIDA QUE CONTENGA AL MENOS UN CARACTER ESPECIAL
//==========================================================
bool validateSpecialCharacter(String value){
  String  pattern = r'[!@#$%^&*(),.?":{}|<>/]';
  RegExp regExp = RegExp(pattern);
  return regExp.hasMatch(value);
}

//==========================================================
/// INFO MESSAGE
//==========================================================
void msginfo( msg ) => print('✅ '+ msg.toString() + ' ✅');

//==========================================================
/// WARNING MESSAGE
//==========================================================
void msgwarn( msg ) => print('🚧 ' + msg.toString() +' 🚧');

//==========================================================
/// ERROR MESSAGE
//==========================================================
void msgerror( msg ) => print('🛑 '+ msg.toString() + ' 🛑');

//==========================================================
/// HEADER WHIT TOKEN
//==========================================================
Map<String, String> getHeaderWithToken() {
    Map<String, String> requestHeaders = {
      "Accept": "application/json",
      "Authorization": "Bearer " + accessToken
    };
    return requestHeaders;
  }

//==========================================================
/// LOADING QUE SE MUESTRA AL CONSUMIR ENDPOINTS
//==========================================================
Future<dynamic> cLoading() {
  return Get.dialog(
    WillPopScope(
      onWillPop: () async => false,
      child: const Center(
        child: CircularProgressIndicator()
      )
    ),
    barrierDismissible: false,
    name: 'dialog_loading'
  );
}


//==========================================================
/// FORMATO PARA LA FECHA, DEVUELVE => Mes dd, yy
//==========================================================
String dateFormat(DateTime _dateTime) {
  String _dateStrFormat;
  _dateStrFormat = (DateFormat('MMMM', 'es_ES').format(_dateTime)).substring(0,1).toUpperCase();
  _dateStrFormat += (DateFormat('MMMM', 'es_ES').format(_dateTime)).substring(1)+' ';
  _dateStrFormat += DateFormat('d', 'es_ES').format(_dateTime)+', ';
  _dateStrFormat += DateFormat('y', 'es_ES').format(_dateTime);
  return _dateStrFormat;
}