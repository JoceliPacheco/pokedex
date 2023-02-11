import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AlertService {
  static toast(String msg) {
    Fluttertoast.showToast(
      msg: "Erro durante conexão com api",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 14.0,
    );
  }
}
