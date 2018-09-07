import 'package:verbal_expressions/verbal_expressions.dart';

class StringUtils {
  static String toAphenized(Object value) {
    final expression = VerbalExpression()..beginCapture()..range([Range('A', 'Z')])..endCapture();
    
    return value.toString().replaceAllMapped(
      expression.toRegExp(),
      (m) => '-${m[0].toLowerCase()}'
    ).replaceAll('.', '').substring(1);
  }
  
  static String format(String format, Map<String, dynamic> params) {
    for (var i = 0; i < params.length; i++) {
      final key = params.keys.elementAt(i);
      final expression = VerbalExpression()..then('\${$key}');

      format = expression.replace(format, params[key].toString());
    }
    
    return format;
  }
}
