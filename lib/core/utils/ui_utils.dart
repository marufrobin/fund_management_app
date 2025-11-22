import 'package:flutter/widgets.dart';

void closeKeyboardOnClick() {
  FocusManager.instance.primaryFocus?.unfocus();
}
