import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home.dart';


main(){
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TaskManagement(),
      debugShowCheckedModeBanner: false,
    );

  }
}
