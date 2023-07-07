
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screen/drawingPad_Screen.dart';

class Drawingcontroller extends GetxController {

  var pickcolor = Color(0xff000000).obs;

  RxDouble strokeWidth = 3.0.obs;

  var currentcolor = Color(0xff000000).obs;

  RxList<Drawingmodal> points = <Drawingmodal>[].obs;

  List<Color> colorlist = [
    Colors.purple,
    Colors.teal,
    Colors.blue,
    Colors.grey,
    Colors.amber,
    Colors.lime
  ];
}














// import 'package:drawing_board/screen/drawingPad_Screen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class DrawingController extends GetxController {
//
//   Rx<Color> selColor = Colors.amber.obs;
//
//   RxList<Color> colorList = <Color>[
//     Colors.amber,
//     Colors.pinkAccent,
//     Colors.redAccent,
//     Colors.indigoAccent,
//     Colors.green,
//     Colors.red,
//     Colors.brown,
//     Colors.cyan
//   ].obs;
//
//   var pickcolor = Colors.purple.obs;
//   RxDouble slider=0.0.obs;
//   var currentcolor = Colors.cyan.obs;
//   RxList<Drawingmodal> points = <Drawingmodal>[].obs;
//
// }
//
//
