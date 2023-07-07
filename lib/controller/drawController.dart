import 'package:drawing_board/screen/drawingPad_Screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawingController extends GetxController {

  Rx<Color> selColor = Colors.amber.obs;

  RxList<Color> colorList = <Color>[
    Colors.amber,
    Colors.pinkAccent,
    Colors.redAccent,
    Colors.indigoAccent,
    Colors.green,
    Colors.red,
    Colors.brown,
    Colors.cyan
  ].obs;

  var pickcolor = Colors.purple.obs;
  RxDouble slider=0.0.obs;
  var currentcolor = Colors.cyan.obs;
  RxList<Drawingmodal> points = <Drawingmodal>[].obs;

}


