import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_corner/smooth_corner.dart';
import 'package:whizapp/Presentation/course_details/course_details_page.dart';
import 'package:whizapp/Presentation/home/featured/widget/featurd_card_widget.dart';
import 'package:whizapp/Presentation/home/widgts/section_heading.dart';
import 'package:whizapp/Presentation/home/widgts/slider_dot.dart';
import 'package:whizapp/Presentation/home/widgts/slider_item.dart';
import 'package:whizapp/Presentation/ongoing/widget.dart/ongoing_item_card.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:whizapp/application/course/course_bloc.dart';
import 'package:whizapp/core/theme/color.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController pageController =
      PageController(initialPage: 1, viewportFraction: 0.8);

  int selectedIndex = 1;
  double x = -1;

  int isActiveSelectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CourseBloc>().add(const CourseEvent.getCourseDetailse());
    });
    return SafeArea(
      child: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: SizedBox(
          child: CustomScrollView(
            slivers: [
              MultiSliver(children: [
                const SizedBox(
                  height: 20,
                ),
                buildSlider(width),
                SliderDots(selectedIndex: selectedIndex),
                const SizedBox(height: 5),
                SectionHeading(title: "Ongoing Course", onPressed: () {}),
                const SizedBox(height: 10),
                const OngoingCardWidget(),
                const SizedBox(height: 10),
                SectionHeading(title: "Top Category", onPressed: () {}),
                const SizedBox(height: 0),
              ]),
              SliverPinnedHeader(
                child: buildCategory(
                  width,
                ),
              ),
              BlocBuilder<CourseBloc, CourseState>(
                builder: (context, state) {
                  if (state.isLoading) {
                    return SliverList(
                        delegate: SliverChildListDelegate([
                      const Center(
                        child: CircularProgressIndicator(
                          backgroundColor: AppColor.primeryLight,
                        ),
                      )
                    ]));
                  } else if (state.isError) {
                    return SliverList(
                        delegate: SliverChildListDelegate([
                      const Text(
                        "Error",
                        style: TextStyle(color: Colors.amber),
                      )
                    ]));
                  } else if (state.isDataPresent) {
                    return buildCourse();
                  }
                  return SliverList(
                      delegate: SliverChildListDelegate([
                    const Text(
                      "No Dataa",
                      style: TextStyle(color: Colors.amber),
                    ),
                  ]));
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCourse() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: 10,
        (context, index) => InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>
                    CourseDetailsePage(courseId: "Course : $index"),
              ),
            );
          },
          child: const FeaturedCardWidget(),
        ),
      ),
    );
  }

  Widget buildCategory(double width) {
    return Container(
      color: AppColor.backgroundLight,
      width: double.maxFinite,
      height: width * 0.18,
      child: ListView.builder(
        itemCount: 20,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Card(
          color: isActiveSelectedIndex == index
              ? AppColor.primeryLight
              : AppColor.backgroundLight,
          margin: const EdgeInsets.only(top: 10, bottom: 15, left: 20),
          shape: SmoothRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              smoothness: 1,
              side: const BorderSide(
                width: 2,
                color: AppColor.primeryLight,
              )),
          elevation: 2,
          shadowColor: AppColor.primeryLight.withOpacity(0.5),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 5),
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: isActiveSelectedIndex == index
                        ? AppColor.whiteLight
                        : AppColor.textPrimeryLight,
                    fontWeight: isActiveSelectedIndex == index
                        ? FontWeight.w800
                        : FontWeight.w400,
                  ),
                  text: "💰",
                  children: const [
                    TextSpan(text: "Business"),
                  ],
                ),
              ),

              // Text(
              //   "💰Business",
              //   textAlign: TextAlign.center,
              //   style: Theme.of(context).textTheme.displayMedium,
              // ),
            ),
          ),
        ),
      ),
    );
  }

  SizedBox buildSlider(double width) => SizedBox(
        height: width * 2 / 5,
        width: width,
        child: PageView.builder(
          pageSnapping: true,
          onPageChanged: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          itemCount: 5,
          controller: pageController,
          itemBuilder: (context, index) {
            var scale = selectedIndex == index ? 1.0 : 0.9;
            return TweenAnimationBuilder(
                tween: Tween(begin: scale, end: scale),
                curve: Curves.ease,
                duration: const Duration(milliseconds: 400),
                child: SLiderItem(),
                builder: (context, value, child) => Transform.scale(
                      child: child,
                      scale: value,
                    ));
          },
        ),
      );
}
