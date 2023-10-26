
import 'package:fluttertoast/fluttertoast.dart';

import '../common_libs.dart';



class Alerts {
  static showToast(String msg, context) {
    return Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: 3,
        webBgColor: "#000000",
        webPosition: "center",
        backgroundColor: Colors.grey,
        textColor: Colors.black,
        fontSize: 16.0);
  }

  static errorToast(String msg, context) {
    return Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: 3,
        webBgColor: "#FF0000",
        webPosition: "center",
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static successToast(String msg, context) {
    return Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: 3,
        webBgColor: "#00B000",
        webPosition: "center",
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static showSnackBar(String msg, context) {
    final snackBar = SnackBar(content: Text(msg));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }




}
