import 'package:ecommerce_app_with_tdd/core/constants/colors/appColors.dart';
import 'package:ecommerce_app_with_tdd/modules/e_commerce/presentation/ui/screens/bottomNavigationScreens/HomeScreen.dart';
import 'package:ecommerce_app_with_tdd/modules/e_commerce/presentation/ui/screens/bottomNavigationScreens/SearchScreen.dart';
import 'package:ecommerce_app_with_tdd/modules/e_commerce/presentation/ui/screens/bottomNavigationScreens/SettingScreen.dart';
import 'package:ecommerce_app_with_tdd/modules/e_commerce/presentation/ui/screens/bottomNavigationScreens/WishListScreen.dart';
import 'package:ecommerce_app_with_tdd/utils/widgets/spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List _screens = const [
    HomeScreen(),
    WishListScreen(),
    SearchScreen(),
    SettingsScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.scaffolColor,
      appBar: AppBar(
        backgroundColor: AppColor.appBarColor,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/logo.svg',
              width: 38.w,
              height: 31.h,
            ),
            addWidth(9.w),
            Text(
              'Stylish',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColor.stylishColor,
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
        actions: [Image.asset('assets/images/circle.png')],
        leading: IconButton(
            onPressed: () {}, icon: SvgPicture.asset('assets/icons/group.svg')),
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
            preferredSize: const Size(double.infinity, 70),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: const Icon(
                        Icons.search,
                        color: AppColor.iconColor,
                      ),
                      suffixIcon: const Icon(
                        Icons.mic_none,
                        color: AppColor.iconColor,
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius:
                              BorderRadius.all(Radius.circular(6.dg))),
                      hintText: "Search any Product.."),
                ),
              ),
            )),
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline), label: 'Wishlist'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings')
        ],
        currentIndex: _currentIndex,
        onTap: (v) {
          _currentIndex = v;
          setState(() {});
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.white,
        elevation: 5,
        child: const Center(
          child: Icon(
            Icons.shopping_cart_outlined,
            color: Colors.black,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
