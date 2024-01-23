import 'package:ecommerce_app_with_tdd/core/constants/extensions/size.dart';
import 'package:ecommerce_app_with_tdd/utils/widgets/spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2)).then((value) => Navigator.pushNamed(context, "PageViewScreen"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/images/logo.svg',
                  width: 274.w, height: 100.h),
              addWidth(context.heigth * 0.01.w),
              Text(
                "Stylish",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xFFF73658),
                  fontSize: 40.sp,
                  fontWeight: FontWeight.w700,
                ),
              )
            ],
          ),
        ),
      );
}
