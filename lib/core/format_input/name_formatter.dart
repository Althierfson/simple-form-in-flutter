import 'package:flutter/services.dart';

class NameFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String formatedText = newValue.text;
    if (newValue.text.length > oldValue.text.length) {
      if (oldValue.text.isEmpty) {
        formatedText = formatedText.toUpperCase();
      } else if (oldValue.text[oldValue.text.length - 1] == " ") {
        String chart = newValue.text[oldValue.text.length];
        chart = chart.toUpperCase();
        formatedText = "${oldValue.text}$chart";
      }
    }

    return TextEditingValue(
        text: formatedText,
        selection: TextSelection.collapsed(offset: formatedText.length));
  }
}
