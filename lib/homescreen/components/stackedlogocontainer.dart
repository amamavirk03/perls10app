import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class StackedLogoContainer extends StatelessWidget {
  const StackedLogoContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none, // This allows children to overflow
      children: [
        Container(
          height: 180.h,
          decoration: BoxDecoration(
            color: Colors.black,
            border: Border.all(color: Colors.white, width: 1),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  'EY announced Imran Aftab as an Entrepreneur of The Year® 2022 Mid-Atlantic Award Winner',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 16),
                Text(
                  'Learn more',
                  style: TextStyle(
                      color: const Color(0xffD4FF1C),
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: -50, // Move the logo upwards to overlap the top border
          left: 20, // Move the logo leftwards to overlap the left border
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Image.asset(
              "assets/images/inc-5000-logo-bw-2.png",
              color: Colors.white,
              width: 80.w,
              height: 80.h,
            ),
          ),
        ),
      ],
    );
  }
}
