import 'package:ecommerce_app_with_tdd/core/constants/extensions/size.dart';
import 'package:ecommerce_app_with_tdd/utils/widgets/spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextWidget extends StatelessWidget {
  final String text1;
  final String text2;
  const TextWidget({super.key, required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text1,
          style: TextStyle(
            color: Colors.black,
            fontSize: 24.sp,
            fontWeight: FontWeight.w800,
          ),
        ),
        addHeigth(context.heigth * 0.02.h),
        Padding(
          padding: const EdgeInsets.all(17.0),
          child: Text(
            text2,
            textAlign: TextAlign.center,
            style: TextStyle(
              letterSpacing: 0.28,
              wordSpacing: 3,
              color: const Color(0xFFA8A8A9),
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        )
      ],
    );
  }
}
