import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      body: Container(
        alignment: Alignment.center,
        child: Row(
          children: [
            Container(
              height: 100.h,
              width: 20.h,
              color: Colors.white,
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(top: 2.h),
              child: Text(
                "ProjectMate",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10.sp),
              ),
            ),
            Container(height: 100.h, width: 80.h, color: Colors.lightBlue[50])
          ],
        ),
      ),
    );
  }
}
