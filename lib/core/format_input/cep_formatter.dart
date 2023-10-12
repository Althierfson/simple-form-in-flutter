import 'package:flutter/services.dart';

class CEPFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String formatedText = newValue.text;

    if (oldValue.text.length < formatedText.length) {
      if (formatedText.length == 5) {
        formatedText = "$formatedText-";
      }
    }

    return TextEditingValue(
        text: formatedText,
        selection: TextSelection.collapsed(offset: formatedText.length));
  }
}
