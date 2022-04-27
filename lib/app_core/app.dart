import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shorten/app_core/app_core.dart';
import 'package:shorten/view/splash/view/splash_view.dart';

import 'package:sizer/sizer.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Poppins',
          scaffoldBackgroundColor: APPColors.appWhite,
        ),
        title: 'Shorten',
        home: const SplashScreen(),
      );
    });
  }
}
