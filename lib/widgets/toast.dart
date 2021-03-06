// creates a toast message depending on the scenario. Used in add/edit button
//screens. May be used else where

import 'package:flutter/cupertino.dart';

import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter/material.dart';

void toastWidget(msg) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Color.fromRGBO(255, 0, 0, 1.0),
    textColor: Color.fromRGBO(255, 255, 255, 1.0),
    fontSize: 16.0,
  );
}
