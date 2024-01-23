import 'package:ecommerce_app_with_tdd/core/singletons/routes/router.dart';
import 'package:ecommerce_app_with_tdd/core/singletons/serviceInit.dart';
import 'package:ecommerce_app_with_tdd/modules/e_commerce/data/repository/eCommerceRepositoryImpl.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(const MyApp());  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => RepositoryProvider(
        create: (context) => ECommerceRepositoryImpl(),
        child: ScreenUtilInit(
          designSize: kIsWeb ? const Size(1440, 1024) : const Size(412, 892),
          builder: (context, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateRoute: RouteList.router.onGenrate,
            initialRoute: "SplashScreen",
          ),
        ),
      );
}
