import 'package:flutter/material.dart';
import 'package:whizapp/Presentation/course_details/widget/expansion_widget.dart';
import 'package:whizapp/Presentation/home/featured/widget/featurd_card_widget.dart';
import 'package:whizapp/core/theme/color.dart';

class CourseDetailsePage extends StatelessWidget {
  final String courseId;
  const CourseDetailsePage({super.key, required this.courseId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          courseId,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                color: Colors.amber,
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Expanded(
                child: CustomScrollView(
              slivers: [buildCourse()],
            ))
          ],
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
          child: const ExpansionWidget(
            currentModuleIndex: 12,
          ),
        ),
      ),
    );
  }
}
