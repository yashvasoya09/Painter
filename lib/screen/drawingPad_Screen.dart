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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(backgroundColor: Colors.cyan.shade100,

        body: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(height: 75.h , width: 90.w,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.w),color: Colors.white),
              child: CustomPaint(
                size: Size.infinite,
              //  painter: PainterClass(),
              ),
            ),



            SizedBox(height: 30,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: control.colorList.length,
                itemBuilder: (context, index) => Container(height: 25,width:25,
                    decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.black),
                  child: CircleAvatar(radius: 10,backgroundColor: control.colorList[index],)),
              ),
            )
          ],
        ),

      ),
    );
  }
}
