import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'views/steps_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const ScreenUtilInit(
          designSize: Size(375, 812), minTextAdapt: true, child: StepsView()),
      theme: ThemeData(textTheme: GoogleFonts.ptSansTextTheme()),
    );
  }
}
