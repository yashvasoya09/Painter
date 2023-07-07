import 'dart:ui';

import 'package:drawing_board/controller/drawController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class DrawingPad_Screen extends StatefulWidget {
  const DrawingPad_Screen({super.key});



  @override
  State<DrawingPad_Screen> createState() => _DrawingPad_ScreenState();
}

class _DrawingPad_ScreenState extends State<DrawingPad_Screen> {

  DrawingController control = Get.put(DrawingController());
  GlobalKey key = GlobalKey();

  @override
  Widget build(BuildContext context) {



    return SafeArea(
      child: Scaffold(backgroundColor: Colors.cyan.shade100,

        body: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(

              onPanStart: (details) {
                setState(() {
                  RenderBox? renderBox =
                  context.findRenderObject() as RenderBox?;
                  control.points.add(Drawingmodal(
                      Paint()
                        ..color = control.currentcolor.value
                        ..strokeCap = StrokeCap.round
                        ..strokeWidth = control.slider.value
                        ..isAntiAlias = true,
                      renderBox!.globalToLocal(details.globalPosition)));
                });
              },
              onPanEnd: (details) {
                setState(() {
                  control.points.add(Drawingmodal(Paint(), Offset.zero));
                });
              },
              onPanUpdate: (details) {
                setState(() {
                  RenderBox? renderBox =
                  context.findRenderObject() as RenderBox?;
                  control.points.add(Drawingmodal(
                      Paint()
                        ..color = control.currentcolor.value
                        ..strokeCap = StrokeCap.round
                        ..strokeWidth = control.slider.value
                        ..isAntiAlias = true,
                      renderBox!.globalToLocal(details.globalPosition)));
                });
              },

              child: Container(height: 75.h , width: 90.w,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.w),color: Colors.white),
                child: CustomPaint(
                    painter: Customdrawing(control.points),
                ),
              ),
            ),



            // SizedBox(height: 30,
            //   child: ListView.builder(
            //     scrollDirection: Axis.horizontal,
            //     itemCount: control.colorList.length,
            //     itemBuilder: (context, index) => Container(height: 25,width:25,
            //         decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.black),
            //       child: CircleAvatar(radius: 10,backgroundColor: control.colorList[index],)),
            //   ),
            // )


          Row(
              children: [
                CircleAvatar(radius: 10,backgroundColor: Colors.amber,),
                InkWell(onTap: () {

                },
                child: CircleAvatar(radius: 10,backgroundColor: Colors.pinkAccent,)),
              ]
              // control.colorList
              //     .map((e) => Padding(
              //   padding: const EdgeInsets.all(8),
              //   child: InkWell(
              //       onTap: () {
              //         control.currentcolor.value = e;
              //       },
              //       child: CircleAvatar(
              //         backgroundColor: e,
              //         radius: 10.sp,
              //       )),
              // ))
              //     .toList()
          ),

          ],
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
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}