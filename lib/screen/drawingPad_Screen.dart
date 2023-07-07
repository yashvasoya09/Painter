import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controller/drawController.dart';

class Drawingscreen extends StatefulWidget {
  const Drawingscreen({super.key});

  @override
  State<Drawingscreen> createState() => _DrawingscreenState();
}

class _DrawingscreenState extends State<Drawingscreen> {
  Drawingcontroller controller = Get.put(Drawingcontroller());
  GlobalKey key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.cyan.shade50,
        key: key,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              controller.points.clear();
              Customdrawing draw=Customdrawing(controller.points);
              draw.cleanData();

            });
          },
          child: Icon(Icons.close, color: Colors.white),
          backgroundColor: Colors.indigo,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        body: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onPanStart: (details) {
                  setState(() {
                    RenderBox? renderBox =
                    context.findRenderObject() as RenderBox?;
                    controller.points.add(Drawingmodal(
                        Paint()
                          ..color = controller.currentcolor.value
                          ..strokeCap = StrokeCap.round
                          ..strokeWidth = controller.slider.value
                          ..isAntiAlias = true,
                        renderBox!.globalToLocal(details.globalPosition)));
                  });
                },
                onPanEnd: (details) {
                  setState(() {
                    controller.points.add(Drawingmodal(Paint(), Offset.zero));
                  });
                },
                onPanUpdate: (details) {
                  setState(() {
                    RenderBox? renderBox =
                    context.findRenderObject() as RenderBox?;
                    controller.points.add(Drawingmodal(
                        Paint()
                          ..color = controller.currentcolor.value
                          ..strokeCap = StrokeCap.square
                          ..strokeWidth = controller.slider.value
                          ..isAntiAlias = true,
                        renderBox!.globalToLocal(details.globalPosition)));
                  });
                },
                child: Container(
                  width: 100.w,
                  height: 80.h,
                  child: CustomPaint(
                    painter: Customdrawing(controller.points),
                  ),
                ),
              ),

              Expanded(
                child: Container(height: 9.h,
                  alignment: Alignment.center,
                  color: Colors.cyan.shade50,
                  child: Column(mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: controller.colorlist
                              .map((e) => Padding(
                            padding: const EdgeInsets.all(8),
                            child: InkWell(
                                onTap: () {
                                  controller.currentcolor.value = e;
                                },
                                child: CircleAvatar(
                                  backgroundColor: e,
                                  radius: 10.sp,
                                )),
                          ))
                              .toList()),
                      Container(
                        height: 3.h,
                        width: 90.w,
                        child: Obx(
                              () => Slider(
                            min: 2,
                            activeColor: controller.currentcolor.value,
                            inactiveColor: controller.currentcolor.value,
                            max: 30,
                            value: controller.slider.value,
                            onChanged: (value) {
                              controller.slider.value = value;
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Drawingmodal {
  Paint paint;
  Offset offset;

  Drawingmodal(this.paint, this.offset);
}

class Customdrawing extends CustomPainter {
  List<Drawingmodal> pointsList;

  Customdrawing(this.pointsList);

  List<Offset> offlist = [];


  void cleanData()
  {
    pointsList.clear();
    offlist.clear();
  }

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < (pointsList.length - 1); i++) {
      if (pointsList[i] != null && pointsList[i + 1] == null) {
        canvas.drawLine(pointsList[i].offset, pointsList[i + 1].offset,
            pointsList[i].paint);
      } else if (pointsList[i] != null && pointsList[i + 1] != null) {
        offlist.clear();
        offlist.add(pointsList[i].offset);
        offlist.add(Offset(
            pointsList[i].offset.dx + 0.1, pointsList[i].offset.dy + 0.1));
        canvas.drawPoints(PointMode.points, offlist, pointsList[i].paint);
      }
    }
  }

  @override
  bool shouldRepaint(Customdrawing oldDelegate) => oldDelegate.pointsList!=pointsList;

}



