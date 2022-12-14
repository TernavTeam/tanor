import 'package:ammlak_app/utils/regex_util.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class MaxWordTextInputFormater extends TextInputFormatter {
  final int maxWords;
  final ValueChanged<int>? currentLength;

  MaxWordTextInputFormater({this.maxWords = 1, this.currentLength});

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    int count = 0;
    if (newValue.text.isEmpty) {
      count = 0;
    } else {
      count = newValue.text.trim().split(RegexUtil.spaceOrNewLine).length;
    }
    if (count > maxWords) {
      return oldValue;
    }
    currentLength?.call(count);
    return newValue;
  }
}
