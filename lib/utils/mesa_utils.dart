import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class MesaUtils {
  static MaskTextInputFormatter phoneFormatter =
      MaskTextInputFormatter(mask: "##/##/####");

  static bool isValidEmail(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
        .hasMatch(email);
  }
}
