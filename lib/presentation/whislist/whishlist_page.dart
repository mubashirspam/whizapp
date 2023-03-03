import 'package:flutter/material.dart';
import 'package:whizapp/presentation/CoursePlayScreen/course_play_screen.dart';

class WhishListPage extends StatelessWidget {
  const WhishListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const CoursePlayScreen(),
              ));
            },
            child: const Text("Play Course")),
      ),
    );
  }
}
