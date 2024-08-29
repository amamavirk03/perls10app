import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageViewContainer extends StatefulWidget {
  const PageViewContainer({super.key});

  @override
  _PageViewContainerState createState() => _PageViewContainerState();
}

class _PageViewContainerState extends State<PageViewContainer> {
  final PageController _pageController = PageController();

  // Define SVG paths for each page
  final List<List<String>> _pageSvgPaths = [
    [
      'assets/svgs/constellation-logo-2.svg',
      'assets/svgs/bbox-logo.svg',
      'assets/svgs/bill-logo-1.svg',
      'assets/svgs/jack-henry-logo.svg',
    ],
    [
      'assets/svgs/constellation-logo-2.svg',
      'assets/svgs/corcentric-logo.svg',
      'assets/svgs/elevance-health-logo-2.svg',
      'assets/svgs/exelon-logo.svg',
    ],
    [
      'assets/svgs/giant-logo.svg',
      'assets/svgs/bbox-logo.svg',
      'assets/svgs/invitation-logo.svg',
      'assets/svgs/jack-henry-logo.svg',
    ],
    [
      'assets/svgs/strides-logo.svg',
      'assets/svgs/constellation-logo-2.svg',
      'assets/svgs/vori-health-logo.svg',
      'assets/svgs/giant-logo.svg',
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.all(16), // Add margin around the container
      padding: EdgeInsets.symmetric(
          horizontal: 10.sp), // Add padding inside the container
      decoration: const BoxDecoration(
        color: Colors.white, // Container background color // Rounded corners
      ),
      child: Column(
        children: [
          // Container with limited height for PageView
          SizedBox(
            height: 500.h, // Set a fixed height for the PageView
            child: PageView.builder(
              controller: _pageController,
              itemCount: _pageSvgPaths.length,
              itemBuilder: (context, pageIndex) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Spread operator to add space between SVGs
                    for (var svgPath in _pageSvgPaths[pageIndex]) ...[
                      SvgPicture.asset(
                        svgPath,
                        height: 40.h, // Adjust height as needed
                      ),
                      const SizedBox(height: 100), // Space between SVGs
                    ],
                    // Remove the last SizedBox (after the last SVG)
                    if (_pageSvgPaths[pageIndex].isNotEmpty)
                      const SizedBox(height: 0),
                  ],
                );
              },
            ),
          ),
          // Add SmoothPageIndicator at the bottom
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SmoothPageIndicator(
              controller: _pageController,
              count: _pageSvgPaths.length,
              effect: ExpandingDotsEffect(
                dotWidth: 10.w,
                dotHeight: 10.h,
                spacing: 16.sp,
                activeDotColor: Colors.black,
                dotColor: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
