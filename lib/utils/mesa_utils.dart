import 'package:fluttertoast/fluttertoast.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:intl/intl.dart';

class MesaUtils {
  static MaskTextInputFormatter phoneFormatter =
      MaskTextInputFormatter(mask: "##/##/####");

  static bool isValidEmail(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
        .hasMatch(email);
  }

  static void showLongToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        fontSize: 16.0);
  }

  static String dateFormatWithUpdate(DateTime date) {
    return DateFormat("dd/MM/yyyy").format(date) +
        " Atualizado em " +
        DateFormat("dd/MM/yyyy kk:mm").format(date);
  }

  static String dateTimeDifference(DateTime date) {
    final difference = date.difference(DateTime.now());
    if (difference.inHours >= 24) {
      return difference.inHours.abs().toString() + " horas atrás";
    } else {
      return difference.inDays.abs().toString() + " dias atrás";
    }
  }
}
