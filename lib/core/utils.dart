import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showSnackbar(BuildContext context, String text){
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar() // hide current snackbar
    ..showSnackBar          // initiates new snackbar
      (SnackBar(content: Text(text)));
}