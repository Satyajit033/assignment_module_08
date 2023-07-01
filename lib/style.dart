import 'package:flutter/material.dart';

InputDecoration myInputStyle(lebel){

  return InputDecoration(
    border: const OutlineInputBorder(),
    contentPadding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
    fillColor: Colors.white,
    filled: true,
    labelText: lebel,

  );

}
