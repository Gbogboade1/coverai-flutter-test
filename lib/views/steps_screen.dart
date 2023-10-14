import 'package:coverai/values/assets.dart';
import 'package:coverai/values/colors.dart';
import 'package:coverai/views/camera_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class StepsView extends StatefulWidget {
  const StepsView({super.key});

  @override
  State<StepsView> createState() => _StepsViewState();
}

class _StepsViewState extends State<StepsView> {
  late ValueNotifier<int> currentIndex;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    currentIndex = ValueNotifier(0);
  }

  @override
  void dispose() {
    currentIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            28.h.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 31.w),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      'Step on how to inspect',
                      style: GoogleFonts.ptSans(
                        fontSize: 22,
                        height: 26.4 / 22,
                        fontWeight: FontWeight.w700,
                        color: AppColors.gray700,
                      ),
                    ),
                  ),
                  22.h.verticalSpace,
                  const Text.rich(
                    TextSpan(
                      text: 'It is important to note all these ',
                      children: [
                        TextSpan(
                            text: 'STEP ',
                            style: TextStyle(
                                color: AppColors.purple500,
                                fontWeight: FontWeight.w600)),
                        TextSpan(text: 'before starting your Inspection ;'),
                      ],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.c5F738C,
                      ),
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            38.h.verticalSpace,
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                padding: EdgeInsets.only(
                  top: 33.h,
                  left: 11.w,
                  right: 11.w,
                  bottom: 19.h,
                ),
                decoration: BoxDecoration(
                  color: AppColors.purple50,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ValueListenableBuilder(
                  valueListenable: currentIndex,
                  builder: (context, value, child) {
                    final item = data[value];
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(data.length, (index) {
                            bool isSelected = value == index;
                            return InkWell(
                              onTap: () {
                                currentIndex.value = index;
                              },
                              child: isSelected
                                  ? Container(
                                      padding: EdgeInsets.only(
                                        left: 8.w,
                                        right: 8.w,
                                        bottom: 2.h,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white,
                                      ),
                                      child: Text.rich(
                                        TextSpan(
                                          text: 'STEP   ',
                                          style: const TextStyle(
                                            color: AppColors.gray700,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 18,
                                            height: 21.6 / 12,
                                          ),
                                          children: [
                                            TextSpan(
                                              text: '${index + 1}',
                                              style: const TextStyle(
                                                color: AppColors.purple500,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            )
                                          ],
                                        ),
                                      ))
                                  : Container(
                                      padding: EdgeInsets.only(
                                        left: 8.w,
                                        right: 8.w,
                                        bottom: 2.w,
                                      ),
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                      ),
                                      child: Text(
                                        '${index + 1}',
                                        style: const TextStyle(
                                          color: AppColors.gray400,
                                          fontSize: 18,
                                          height: 21.6 / 12,
                                        ),
                                      ),
                                    ),
                            );
                          }),
                        ),
                        55.h.verticalSpace,
                        item.richText,
                        const Spacer(),
                        if (item.label.isNotEmpty)
                          Text(
                            item.label,
                            style: const TextStyle(
                              color: AppColors.c909090,
                              fontSize: 16,
                              height: 24 / 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        5.h.verticalSpace,
                        AnimatedContainer(
                          duration: const Duration(seconds: 2),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              data[value].image,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            38.h.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: ValueListenableBuilder(
                valueListenable: currentIndex,
                builder: (context, value, child) => Row(
                  children: [
                    value == data.length - 1
                        ? const SizedBox.shrink()
                        : Expanded(
                            child: MaterialButton(
                                onPressed: gotoCameraScreen,
                                child: const Text(
                                  'Skip',
                                  style: TextStyle(
                                    color: AppColors.gray700,
                                    fontSize: 14,
                                    height: 24 / 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )),
                          ),
                    Expanded(
                      child: MaterialButton(
                        height: 48.h,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                        color: AppColors.primary,
                        onPressed: () {
                          if (value == data.length - 1) {
                            gotoCameraScreen();
                          } else {
                            currentIndex.value = value + 1;
                          }
                        },
                        child: Text(
                          value == data.length - 1
                              ? 'Start Inspection'
                              : 'Next Step',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            height: 24 / 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  gotoCameraScreen() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const CameraScreen(),
    ));
  }

  final data = <Data>[
    Data(
      label: '',
      image: AppAssets.ASSETS_1_PNG,
      richText: RichText(
        text: const TextSpan(
          text: 'Park your Vehicle in a ',
          children: [
            TextSpan(
              text: 'well-lit, shaded, ',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            TextSpan(text: 'and '),
            TextSpan(
              text: 'spacious area, ',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            TextSpan(text: 'ensuring there are '),
            TextSpan(
              text: 'no obstructions.',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ],
          style: TextStyle(
            fontSize: 18,
            height: 25.5 / 18,
            fontWeight: FontWeight.w400,
            color: AppColors.gray700,
          ),
        ),
      ),
    ),
    Data(
      label: 'Front View',
      image: AppAssets.ASSETS_2_PNG,
      richText: RichText(
        text: const TextSpan(
          text: 'Take picture of your  ',
          children: [
            TextSpan(
              text: 'Vehicle\'s ',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: 'front view',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: AppColors.primary,
              ),
            ),
            TextSpan(text: ', ensuring it fills about '),
            TextSpan(
              text: '80% ',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: AppColors.primary,
              ),
            ),
            TextSpan(
              text: 'of your camera screen',
            ),
          ],
          style: TextStyle(
            fontSize: 18,
            height: 25.5 / 18,
            fontWeight: FontWeight.w400,
            color: AppColors.gray700,
          ),
        ),
      ),
    ),
    Data(
      label: 'Left View ( Driver side )',
      image: AppAssets.ASSETS_3_PNG,
      richText: RichText(
        text: const TextSpan(
          text: 'Take picture of your  ',
          children: [
            TextSpan(
              text: 'Vehicle\'s ',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: 'Left View',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: AppColors.primary,
              ),
            ),
            TextSpan(text: ', ensuring it fills about '),
            TextSpan(
              text: '80% ',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: AppColors.primary,
              ),
            ),
            TextSpan(
              text: 'of your camera screen',
            ),
          ],
          style: TextStyle(
            fontSize: 18,
            height: 25.5 / 18,
            fontWeight: FontWeight.w400,
            color: AppColors.gray700,
          ),
        ),
      ),
    ),
    Data(
      label: 'Back View',
      image: AppAssets.ASSETS_4_PNG,
      richText: RichText(
        text: const TextSpan(
          text: 'Take picture of your  ',
          children: [
            TextSpan(
              text: 'Vehicle\'s ',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: 'Back View',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: AppColors.primary,
              ),
            ),
            TextSpan(text: ', ensuring it fills about '),
            TextSpan(
              text: '80% ',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: AppColors.primary,
              ),
            ),
            TextSpan(
              text: 'of your camera screen',
            ),
          ],
          style: TextStyle(
            fontSize: 18,
            height: 25.5 / 18,
            fontWeight: FontWeight.w400,
            color: AppColors.gray700,
          ),
        ),
      ),
    ),
    Data(
      label: 'Right View',
      image: AppAssets.ASSETS_5_PNG,
      richText: RichText(
        text: const TextSpan(
          text: 'Take picture of your  ',
          children: [
            TextSpan(
              text: 'Vehicle\'s ',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: 'Right View',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: AppColors.primary,
              ),
            ),
            TextSpan(text: ', ensuring it fills about '),
            TextSpan(
              text: '80% ',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: AppColors.primary,
              ),
            ),
            TextSpan(
              text: 'of your camera screen',
            ),
          ],
          style: TextStyle(
            fontSize: 18,
            height: 25.5 / 18,
            fontWeight: FontWeight.w400,
            color: AppColors.gray700,
          ),
        ),
      ),
    ),
    Data(
      label: 'Chassis number',
      image: AppAssets.ASSETS_6_PNG,
      richText: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: const TextSpan(
              text: 'Take picture of your  ',
              children: [
                TextSpan(
                  text: 'Vehicle\'s ',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text: 'Chassis no.',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: AppColors.primary,
                  ),
                ),
              ],
              style: TextStyle(
                fontSize: 18,
                height: 25.5 / 18,
                fontWeight: FontWeight.w400,
                color: AppColors.gray700,
              ),
            ),
          ),
          12.h.verticalSpace,
          Row(
            children: [
              Container(
                height: 8,
                width: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.purple500),
                ),
              ),
              8.w.horizontalSpace,
              Expanded(
                child: RichText(
                  text: const TextSpan(
                    text: 'You can locate the chassis number on the ',
                    children: [
                      TextSpan(
                        text: '\nfront windshield,',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: AppColors.primary,
                        ),
                      ),
                      TextSpan(text: 'or'),
                    ],
                    style: TextStyle(
                      fontSize: 14,
                      height: 17 / 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.gray700,
                    ),
                  ),
                ),
              )
            ],
          ),
          12.h.verticalSpace,
          Row(
            children: [
              Container(
                height: 8,
                width: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.purple500),
                ),
              ),
              8.w.horizontalSpace,
              Expanded(
                child: RichText(
                  text: const TextSpan(
                    text: 'You can find it on the ',
                    children: [
                      TextSpan(
                        text: 'interior door ',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: AppColors.primary,
                        ),
                      ),
                      TextSpan(text: 'of the '),
                      TextSpan(
                        text: '\ndriver\'s side',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                    style: TextStyle(
                      fontSize: 14,
                      height: 17 / 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.gray700,
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    ),
    Data(
      label: 'Vehicle Dashboard',
      image: AppAssets.ASSETS_7_PNG,
      richText: RichText(
        text: const TextSpan(
          text: 'Take picture of your  ',
          children: [
            TextSpan(
              text: 'Vehicle\'s ',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: 'Dashboard',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: AppColors.primary,
              ),
            ),
            TextSpan(text: ', ensuring it fills about '),
            TextSpan(
              text: '80% ',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: AppColors.primary,
              ),
            ),
            TextSpan(
              text: 'of your camera screen',
            ),
          ],
          style: TextStyle(
            fontSize: 18,
            height: 25.5 / 18,
            fontWeight: FontWeight.w400,
            color: AppColors.gray700,
          ),
        ),
      ),
    ),
    Data(
      label: 'Vehicle Backview',
      image: AppAssets.ASSETS_8_PNG,
      richText: RichText(
        text: const TextSpan(
          text: 'Take picture of your  ',
          children: [
            TextSpan(
              text: 'Vehicle\'s ',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: 'Interior Back view',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: AppColors.primary,
              ),
            ),
            TextSpan(text: ', ensuring it fills about '),
            TextSpan(
              text: '80% ',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: AppColors.primary,
              ),
            ),
            TextSpan(
              text: 'of your camera screen',
            ),
          ],
          style: TextStyle(
            fontSize: 18,
            height: 25.5 / 18,
            fontWeight: FontWeight.w400,
            color: AppColors.gray700,
          ),
        ),
      ),
    ),
  ];
}

class Data {
  final String image, label;
  final Widget richText;

  Data({
    required this.image,
    required this.richText,
    required this.label,
  });
}
