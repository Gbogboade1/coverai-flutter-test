import 'package:coverai/values/assets.dart';
import 'package:coverai/values/colors.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              AppAssets.ASSETS_LAND_PNG,
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: Container(
              width: 375,
              height: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFF7C7C7C).withOpacity(.50),
              ),
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: 'Vehicle\'s ',
                          ),
                          TextSpan(
                            text: 'Left Side',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: AppColors.primary,
                            ),
                          ),
                          TextSpan(text: 'View'),
                        ],
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Text(
                      'Take Vehicle left view',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    46.w.verticalSpace,
                    Image.asset(
                      AppAssets.ASSETS_CAR_PNG,
                      height: 81,
                    ),
                    20.w.verticalSpace,
                    Row(
                      children: [
                        Expanded(
                          child: MaterialButton(
                            height: 46,
                            minWidth: 124,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.02)),
                            onPressed: () {},
                            color: Colors.white,
                            child: const Text(
                              'Go back',
                              style: TextStyle(
                                color: AppColors.gray700,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        12.h.horizontalSpace,
                        Expanded(
                          child: MaterialButton(
                            height: 46,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.02)),
                            onPressed: () {},
                            color: AppColors.primary,
                            child: const Text(
                              'Start',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 42,
                    width: 42,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.red, width: 4),
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        height: 31,
                        width: 31,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Text(
                            '2:00',
                            style: TextStyle(
                              color: AppColors.red,
                              fontSize: 14
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  45.w.verticalSpace,
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: AppColors.bg,
                        borderRadius: BorderRadius.circular(17.9)),
                    child: Column(
                      children: List.generate(
                          6,
                          (index) => Container(
                                margin: EdgeInsets.only(
                                    bottom: index != 5 ? 7.5 : 0),
                                height: 25,
                                width: 25,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFACACAC),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.check,
                                  color: Colors.white.withOpacity(.35),
                                  size: 16,
                                ),
                              )),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
