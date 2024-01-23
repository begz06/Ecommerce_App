import 'package:ecommerce_app_with_tdd/core/constants/colors/appColors.dart';
import 'package:ecommerce_app_with_tdd/modules/e_commerce/presentation/ui/screens/pageViewScreens/firstPage.dart';
import 'package:ecommerce_app_with_tdd/modules/e_commerce/presentation/ui/screens/pageViewScreens/secondPage.dart';
import 'package:ecommerce_app_with_tdd/modules/e_commerce/presentation/ui/screens/pageViewScreens/thirdPage.dart';
import 'package:ecommerce_app_with_tdd/utils/widgets/spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageViewScreen extends StatefulWidget {
  const PageViewScreen({super.key});

  @override
  State<PageViewScreen> createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {
  int _currentIndex = 0;
  final List _screens = const [FirstPage(), SecondPage(), ThirdPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        children: [_screens[_currentIndex]],
        onPageChanged: (v) {
          v = _currentIndex;
          setState(() {});
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton(
              onPressed: () {
                if (_currentIndex > 0) {
                  _currentIndex--;
                }
                setState(() {});
              },
              child: const Text(
                "Prev",
                style: TextStyle(
                  color: Color(0xFFC4C4C4),
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                  decoration: BoxDecoration(
                      color: _currentIndex == 0
                          ? AppColor.activeIndicatorColor
                          : AppColor.inActiveIndicatorColor,
                      borderRadius: BorderRadius.circular(100)),
                  width: _currentIndex == 0 ? 30.w : 10.w,
                  height: 10.h,
                  duration: const Duration(milliseconds: 10)),
              addWidth(5),
              AnimatedContainer(
                  decoration: BoxDecoration(
                      color: _currentIndex == 1
                          ? AppColor.activeIndicatorColor
                          : AppColor.inActiveIndicatorColor,
                      borderRadius: BorderRadius.circular(100)),
                  width: _currentIndex == 1 ? 30.w : 10.w,
                  height: 10.h,
                  duration: const Duration(milliseconds: 10)),
              addWidth(5),
              AnimatedContainer(
                  decoration: BoxDecoration(
                      color: _currentIndex == 2
                          ? AppColor.activeIndicatorColor
                          : AppColor.inActiveIndicatorColor,
                      borderRadius: BorderRadius.circular(100)),
                  width: _currentIndex == 2 ? 30.w : 10.w,
                  height: 10.h,
                  duration: const Duration(milliseconds: 10)),
            ],
          ),
          TextButton(
              onPressed: () {
                if (_currentIndex == 2) {
                  // If we're on the last screen, navigate to 'HomePage'
                  Navigator.pushNamed(context, 'HomePage');
                } else {
                  // If not on the last screen, increment _currentIndex
                  _currentIndex++;
                  setState(() {});
                }
              },
              child: Text(
                _currentIndex == 2 ? "Get Started" : "Next",
                style: const TextStyle(
                  color: Color(0xFFF73658),
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ))
        ],
      ),
    );
  }
}
