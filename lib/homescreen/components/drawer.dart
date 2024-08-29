import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class MyDrawer extends StatelessWidget {
  final bool isDrawerSearching; // Drawer search toggle state
  final TextEditingController
      drawerSearchController; // Drawer search controller
  final VoidCallback onSearchToggle; // Callback to toggle drawer search mode

  const MyDrawer({
    super.key,
    required this.isDrawerSearching,
    required this.drawerSearchController,
    required this.onSearchToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black.withOpacity(0.8),
      width: double.infinity,
      child: Container(
        decoration: const BoxDecoration(),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 100.h,
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    top: 35.h, right: 10.w, left: 10.w, bottom: 15.h),
                child: Row(
                  children: [
                    if (isDrawerSearching)
                      Expanded(
                        child: TextField(
                          controller:
                              drawerSearchController, // Drawer search input controller
                          autofocus: true,
                          decoration: const InputDecoration(
                            hintText: 'Search in drawer...',
                            hintStyle: TextStyle(color: Colors.white54),
                            border: InputBorder.none,
                          ),
                          style: const TextStyle(color: Colors.white),
                        ),
                      )
                    else
                      SvgPicture.asset(
                        width: 50.w,
                        height: 50.h,
                        "assets/svgs/10P-Logo.svg",
                        color: Colors.white,
                      ),
                    const Spacer(),
                    IconButton(
                      icon: Icon(
                        Icons.search, // Only the search icon remains
                        size: 30.sp,
                      ),
                      color: Colors.white,
                      onPressed: onSearchToggle, // Toggle drawer search mode
                    ),
                    SizedBox(width: 10.w),
                    IconButton(
                      icon: Icon(
                        Icons.close,
                        size: 30.sp,
                      ),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pop(context); // Close the drawer
                      },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    drawerlist(Texthere: "Company", arroricon: true),
                    SizedBox(height: 30.h),
                    drawerlist(Texthere: "Services", arroricon: true),
                    SizedBox(height: 30.h),
                    drawerlist(Texthere: "Platform", arroricon: true),
                    SizedBox(height: 30.h),
                    drawerlist(Texthere: "Industries", arroricon: true),
                    SizedBox(height: 30.h),
                    drawerlist(Texthere: "Insights", arroricon: false),
                    SizedBox(height: 30.h),
                    drawerlist(Texthere: "Careers", arroricon: true),
                    SizedBox(height: 30.h),
                    drawerlist(Texthere: "Contacts", arroricon: false),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget drawerlist({required String Texthere, required bool arroricon}) {
    return Row(
      children: [
        Text(
          Texthere,
          style: TextStyle(
            color: Colors.white,
            fontSize: 25.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        const Spacer(),
        arroricon
            ? Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 30.sp,
              )
            : Container(),
      ],
    );
  }
}
