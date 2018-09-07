class StringUtils {
  static String toAphenized(dynamic value) {
    return value.toString()
      .replaceAllMapped(
        RegExp("/\b[a-z]/g"),
        (m) => "-" + m.input.toLowerCase()
      )
      .replaceAll(
        RegExp("\."),
        "-"
      );
  }
  
  static String format(String format, Map<String, dynamic> params) {
    return format.replaceAllMapped(
      RegExp("\$\{.*\}"), 
      (m) => params[m.input]
    );
  }
}
