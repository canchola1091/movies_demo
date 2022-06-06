
import 'package:movies_demo/src/utils/utils.dart' as utils;

class Validations {

  //==========================================================
  /// VERIFICA QUE UN EMAIL SEA VALIDO
  //==========================================================
  static String? validEmail(String value) {
    if(value.isEmpty) return 'Campo requerido.';
    if(!utils.validarEmail(value)) return 'Email no valido.';
    return null;
  } 

  //==========================================================
  /// VALIDA SI EL CAMPO ES REUQERIDO (ACEPTA MINIMO DE CARACTERES)
  //==========================================================
  static String? validRequiredAndLength(String? _val, [int? _minLength]) {
    if (_val == null || _val.isEmpty) return 'Campo requerido.';
    if (_minLength != null && _val.length < _minLength) return 'Minimo $_minLength caracteres.';
    return null;
  }

}