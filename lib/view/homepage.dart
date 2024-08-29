import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:perls10app/homescreen/components/drawer.dart';
import 'package:perls10app/homescreen/components/insightcardc.dart';
import 'package:perls10app/homescreen/components/pageviewcontainer.dart';
import 'package:perls10app/homescreen/components/stackContainer.dart';
import 'package:perls10app/homescreen/components/stackedlogocontainer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> svgImages = [
    "assets/svgs/amwell-logo.svg",
    "assets/svgs/bbox-logo.svg",
    "assets/svgs/bill-logo-1.svg",
    "assets/svgs/cocacola-logo.svg",
    "assets/svgs/constellation-logo-2.svg",
    "assets/svgs/corcentric-logo.svg",
    "assets/svgs/exelon-logo.svg",
    "assets/svgs/giant-logo.svg",
    "assets/svgs/hilton-logo.svg",
    "assets/svgs/invitation-logo.svg",
    "assets/svgs/jack-henry-logo.svg",
    "assets/svgs/strides-logo.svg",
    "assets/svgs/villagemd-logo.svg",
    "assets/svgs/vori-health-logo.svg"
  ];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool isSearching =
      false; // To toggle between header and search bar in main screen
  bool isDrawerSearching =
      false; // To toggle between header and search bar in drawer
  TextEditingController searchController =
      TextEditingController(); // Controller for main screen search
  TextEditingController drawerSearchController =
      TextEditingController(); // Controller for drawer search

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: MyDrawer(
        isDrawerSearching:
            isDrawerSearching, // Pass the search state to the drawer
        drawerSearchController:
            drawerSearchController, // Pass the drawer search controller
        onSearchToggle: () {
          setState(() {
            isDrawerSearching = !isDrawerSearching; // Toggle drawer search mode
            if (!isDrawerSearching) {
              drawerSearchController
                  .clear(); // Clear drawer search input when exiting search mode
            }
          });
        },
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 660.h,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/mobile-bg.webp'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 100.h,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.8),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 35.h, right: 10.w, left: 10.w, bottom: 15.h),
                      child: Row(
                        children: [
                          if (isSearching)
                            Expanded(
                              child: TextField(
                                controller:
                                    searchController, // Search input controller for main screen
                                autofocus: true,
                                decoration: const InputDecoration(
                                  hintText: 'Search...',
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
                              isSearching
                                  ? Icons.close
                                  : Icons.search, // Toggle icon for main screen
                              size: 30.sp,
                            ),
                            color: Colors.white,
                            onPressed: () {
                              setState(() {
                                isSearching =
                                    !isSearching; // Toggle main screen search mode
                                if (!isSearching) {
                                  searchController
                                      .clear(); // Clear search input when exiting search mode
                                }
                              });
                            },
                          ),
                          SizedBox(width: 10.w),
                          IconButton(
                            icon: Icon(
                              Icons.menu,
                              size: 30.sp,
                            ),
                            color: Colors.white,
                            onPressed: () {
                              _scaffoldKey.currentState
                                  ?.openEndDrawer(); // Open end drawer
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Column(
                      children: [
                        Text(
                          "Reimagine. Deliver. \nRepeat.",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 35.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 15.h),
                        Text(
                          "Global digital partner helping business transform, create new products and scale team",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 23.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 15.h),
                        Text(
                          "AI is embedded in everything we do.",
                          style: TextStyle(
                            color: const Color(0xffD4FF1C),
                            fontSize: 23.sp,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        SizedBox(height: 40.h),
                        Container(
                          width: 210.w,
                          height: 50.h,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 1),
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: Center(
                            child: Text(
                              "Let's connect",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 50.h),
                        SizedBox(
                          width: double.infinity.w,
                          height: 90.h,
                          child: Image.asset("assets/images/card.png"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity.w,
              height: 45.h,
              color: const Color(0xffD4FF1C),
              child: Row(
                children: [
                  SizedBox(width: 20.w),
                  const Text(
                    "JUMP TO SECTION",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  SizedBox(width: 20.w),
                  const Icon(
                    Icons.keyboard_arrow_down,
                    size: 35,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10.sp),
              child: Column(
                children: [
                  SizedBox(height: 50.h),
                  Text(
                    "You are in great company",
                    style: TextStyle(
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  SizedBox(height: 70.h),
                  const PageViewContainer(),
                  SizedBox(height: 70.h),
                  Text(
                    "Global team of creators and inovators",
                    style: TextStyle(
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity.w,
              child: Image.asset(
                "assets/images/download.jpeg",
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  const Text(
                    "Our superpowers",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  const Text(
                    "Industry expertise",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  const Text(
                    "We bring relevancy and context to problem solving. Our domain experts leverage deep industry knowledge to identify and implement the most effective solution to address your business challenges.",
                    style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  const Text(
                    "Experts in AI",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  const Text(
                    "AI is embedded in everything we do. We help your businesses unlock their potential via AI and advanced technologies to future-proof your business. Our AI Launchpad gets you from idea to POC in 90 days.",
                    style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  const Text(
                    "Delivery excellence",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  const Text(
                    "We get sh*t done. Our deep technical expertise, along with our focus on agile, high-velocity delivery ensures customer satisfaction.",
                    style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  const Text(
                    "Global presence",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  const Text(
                    "1,300+ experts across 4 continents. Our delivery teams in Latin America, North America, Asia and Europe allow us to serve as a global digital transformation partner to businesses looking to scale and innovate with efficiency.",
                    style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  const Text(
                    "Product mindset",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  const Text(
                    "We focus on delivering true value. Our teams invest the time to understand the business goals of your product, allowing us to deliver outcomes vs outputs. This provides not just direction but a sense of ownership to our development teams.",
                    style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  const Text(
                    "Security implentation",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  const Text(
                    "We treat security as a first-class citizen. We are experts at addressing the unique challenges of regulated industries and their stringent regulatory and compliance requirements. Our customers span healthcare, financial services, telecom, energy and more.",
                    style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity.w,
              height: 945.h,
              decoration: const BoxDecoration(color: Colors.black),
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 30.sp, vertical: 60.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Insights",
                      style: TextStyle(
                        color: Color(0xffD4FF1C),
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    const InsightPageViewContainer(),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  const Text(
                    "Case studies",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  const Text(
                    "We treat security as a first-class citizen. We are experts at addressing the unique challenges of regulated industries and their stringent regulatory and compliance requirements. Our customers span healthcare, financial services, telecom, energy and more.",
                    style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  const StackContainer(),
                  SizedBox(
                    height: 20.h,
                  ),
                  const StackContainer(),
                  SizedBox(
                    height: 20.h,
                  ),
                  const StackContainer(),
                  SizedBox(
                    height: 20.h,
                  ),
                  const StackContainer(),
                  SizedBox(
                    height: 50.h,
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity.w,
              height: 1100.h,
              decoration: const BoxDecoration(color: Colors.black),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    SizedBox(height: 20.h),
                    Text(
                      "Awards & recognitions",
                      style: TextStyle(
                          color: const Color(0xffD4FF1C),
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 60.h),
                    const StackedLogoContainer(),
                    SizedBox(height: 40.h),
                    const StackedLogoContainer(),
                    SizedBox(height: 40.h),
                    const StackedLogoContainer(),
                    SizedBox(height: 40.h),
                    const StackedLogoContainer(),
                    SizedBox(height: 40.h),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity.w,
              height: 950.h,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 39, 39, 39),
              ),
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 20.sp, vertical: 40.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      height: 50.h,
                      "assets/svgs/10P-Logo.svg",
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Text(
                      "10Pearls is an award-winning digital development company, helping businesses with product design, development, and technology acceleration.",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w300),
                    ),
                    Text(
                      "________________________________",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w300),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              "Company",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 30.h),
                            Text(
                              "Services",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 30.h),
                            Text(
                              "Industries",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 70.w,
                        ),
                        Column(
                          children: [
                            Text(
                              "Insights",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 30.h),
                            Text(
                              "Careees",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 30.h),
                            Text(
                              "Contact",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      "________________________________",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w300),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "USA (HQ in Wash DC)",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 30.h),
                            Text(
                              "Costa Rica",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 30.h),
                            Text(
                              "Pakistan",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 50.w,
                        ),
                        Column(
                          children: [
                            Text(
                              "Colombia",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 30.h),
                            Text(
                              "Peru",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 30.h),
                            Text(
                              "UK",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      "________________________________",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w300),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Column(
                      children: [
                        Text(
                          "+1-703-935-1919",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          " info@10pearls.com",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            iconcontainer(),
                            SizedBox(width: 30.w),
                            iconcontainer(),
                            SizedBox(width: 30.w),
                            iconcontainer(),
                          ],
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Text(
                          " Privacy Policy",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget iconcontainer() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: const BorderRadius.all(
          Radius.circular(50),
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.all(1.0),
        child: Icon(
          Icons.facebook,
          size: 60,
          color: Colors.white,
        ),
      ),
    );
  }
}
