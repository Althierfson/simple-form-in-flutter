import 'package:flutter/services.dart';

class BirthFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String formatedText = newValue.text;
    if (formatedText.length == 2 && oldValue.text.length != 3) {
      formatedText = '$formatedText/';
    } else if (formatedText.length == 5 && oldValue.text.length != 6) {
      formatedText = "$formatedText/";
    }

    return TextEditingValue(
        text: formatedText,
        selection: TextSelection.collapsed(offset: formatedText.length));
  }
}
