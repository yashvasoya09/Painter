import 'package:drawing_board/screen/drawingPad_Screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(
    Sizer(builder: (context, orientation, deviceType) =>  GetMaterialApp(
        debugShowCheckedModeBanner: false,

        routes: {
          "/":(p0) => DrawingPad_Screen()
        },
      ),
    ),
  );
}
