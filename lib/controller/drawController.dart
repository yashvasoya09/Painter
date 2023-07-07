import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawingController extends GetxController {

  Rx<Color> selColor = Colors.amber.obs;

  List<Color> colorList = [
    Colors.amber,
    Colors.pinkAccent,
    Colors.redAccent,
    Colors.indigoAccent,
    Colors.green,
    Colors.red,
    Colors.brown,
    Colors.cyan
  ];

}


