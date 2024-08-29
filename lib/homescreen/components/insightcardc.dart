import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class InsightPageViewContainer extends StatefulWidget {
  const InsightPageViewContainer({super.key});

  @override
  _InsightPageViewContainerState createState() =>
      _InsightPageViewContainerState();
}

class _InsightPageViewContainerState extends State<InsightPageViewContainer> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 760.h, // Container height
      decoration: const BoxDecoration(color: Colors.black),
      child: Column(
        children: [
          // PageView widget
          Expanded(
            flex: 8, // PageView takes up most of the space
            child: PageView(
              controller: _pageController,
              children: [
                insightCard(), // Page 1
                insightCard(), // Page 2
                insightCard(), // Page 3
                insightCard(), // Page 4
              ],
            ),
          ),
          // SmoothPageIndicator at the bottom
          SizedBox(
            height: 30.h, // Height for the SmoothPageIndicator area
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.sp),
              child: Align(
                alignment: Alignment.center,
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: 4, // Number of pages
                  effect: const ExpandingDotsEffect(
                    dotWidth: 10,
                    dotHeight: 10,
                    spacing: 16,
                    activeDotColor: Color(0xffD4FF1C),
                    dotColor: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget insightCard() {
    return Container(
      margin: EdgeInsets.all(10.sp),
      height: 710.h, // Height of the content inside the PageView
      color: const Color(0xff171616),
      child: Column(
        children: [
          Image.asset(
            "assets/images/fc-thumb-gen-ai-legacy-system.jpg",
            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "ARTIFICIAL INTELLIGENCE",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                const Text(
                  "Putting GenAI to Work for Legacy System Modernization",
                  style: TextStyle(
                    color: Color(0xffD4FF1C),
                    fontSize: 35,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Read more",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xffD4FF1C),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}