import 'package:verbal_expressions/verbal_expressions.dart';

class StringUtils {
  static String toAphenized(Object value) {
    final expression = VerbalExpression()..then('[A-Z]');
    var result = expression.replace(value.toString(), '-');

    if (result.startsWith('-'))
      result = result.substring(1);

      return result;
  }
  
  static String format(String format, Map<String, dynamic> params) {
    for (var i = 0; i < params.length; i++) {
      final key = params.keys.elementAt(i);
      final expression = VerbalExpression()..then('\${$key}');

      format = expression.replace(format, params[key]);
    }
    
    return format;
  }
}
