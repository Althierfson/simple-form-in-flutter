import 'package:flutter/services.dart';

class CPFFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String formatedText = newValue.text;

    if (oldValue.text.length < formatedText.length) {
      if (formatedText.length == 3 || formatedText.length == 7) {
        formatedText = "$formatedText.";
      }
      // xxx.xxx.xxx-xx
      if (formatedText.length == 11) {
        formatedText = "$formatedText-";
      }
    }

    return TextEditingValue(
        text: formatedText,
        selection: TextSelection.collapsed(offset: formatedText.length));
  }
}
