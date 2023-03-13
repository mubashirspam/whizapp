import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:whizapp/model/course/course_mode.dart';

class FirestoreService {
  final CollectionReference _coursesCollection =
      FirebaseFirestore.instance.collection('courses');

  Future<void> createCourse(CourseModel course) async {
    try {
      await _coursesCollection.doc(course.id).set(course.toMap());
    } catch (e) {
      log(e.toString());
    }
  }
}

class CourseController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final courses = <CourseModel>[].obs;
  final isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCourses();
  }

  void fetchCourses() async {
    try {
      isLoading(true);
      final QuerySnapshot<Map<String, dynamic>> coursesQuery =
          await _firestore.collection('courses').get();
      courses.assignAll(
        coursesQuery.docs
            .map(
              (doc) => CourseModel.fromFirestore(doc),
            )
            .toList(),
      );
    } finally {
      isLoading(false);
    }
  }
}

final course = CourseModel(
  id: 'course3',
  name: 'Flutter Course',
  description: 'Learn Flutter development',
  rating: 4.5,

  comments: [
    Comment(author: 'John Doe', text: 'Great course!'),
    Comment(author: 'Jane Smith', text: 'Very helpful'),
  ],
  modules: [
    Module(
      title: 'Getting Started',
      videos: [
        Video(title: 'Introduction', url: 'bNn0gO0X4IM'),
        Video(title: 'Setting up the environment', url: 'bNn0gO0X4IM'),
      ],
      pdfs: [
        PDF(title: 'Flutter Basics', url: 'https://example.com/pdf1'),
      ],
    ),
    Module(
      title: 'Building UIs',
      videos: [
        Video(title: 'Layouts', url: 'bNn0gO0X4IM'),
        Video(title: 'Widgets', url: 'bNn0gO0X4IM'),
      ],
      pdfs: [],
    ),
    Module(
      title: 'Building UIs',
      videos: [
        Video(title: 'Layouts', url: 'bNn0gO0X4IM'),
        Video(title: 'Widgets', url: 'bNn0gO0X4IM'),
      ],
      pdfs: [],
    ),
    Module(
      title: 'Building UIs',
      videos: [
        Video(title: 'Layouts', url: 'bNn0gO0X4IM'),
        Video(title: 'Widgets', url: 'bNn0gO0X4IM'),
      ],
      pdfs: [],
    ),
    Module(
      title: 'Building UIs',
      videos: [
        Video(title: 'Layouts', url: 'bNn0gO0X4IM'),
        Video(title: 'Widgets', url: 'bNn0gO0X4IM'),
      ],
      pdfs: [],
    ),
    Module(
      title: 'Building UIs',
      videos: [
        Video(title: 'Layouts', url: 'bNn0gO0X4IM'),
        Video(title: 'Widgets', url: 'bNn0gO0X4IM'),
      ],
      pdfs: [],
    ),
    Module(
      title: 'Building UIs',
      videos: [
        Video(title: 'Layouts', url: 'bNn0gO0X4IM'),
        Video(title: 'Widgets', url: 'bNn0gO0X4IM'),
      ],
      pdfs: [],
    ),
    Module(
      title: 'Building UIs',
      videos: [
        Video(title: 'Layouts', url: 'bNn0gO0X4IM'),
        Video(title: 'Widgets', url: 'bNn0gO0X4IM'),
      ],
      pdfs: [],
    ),
    Module(
      title: 'Building UIs',
      videos: [
        Video(title: 'Layouts', url: 'bNn0gO0X4IM'),
        Video(title: 'Widgets', url: 'bNn0gO0X4IM'),
      ],
      pdfs: [],
    ),
    Module(
      title: 'Building UIs',
      videos: [
        Video(title: 'Layouts', url: 'bNn0gO0X4IM'),
        Video(title: 'Widgets', url: 'bNn0gO0X4IM'),
      ],
      pdfs: [],
    ),
    Module(
      title: 'Building UIs',
      videos: [
        Video(title: 'Layouts', url: 'bNn0gO0X4IM'),
        Video(title: 'Widgets', url: 'bNn0gO0X4IM'),
      ],
      pdfs: [],
    ),
    Module(
      title: 'Building UIs',
      videos: [
        Video(title: 'Layouts', url: 'bNn0gO0X4IM'),
        Video(title: 'Widgets', url: 'bNn0gO0X4IM'),
      ],
      pdfs: [],
    ),
    Module(
      title: 'Building UIs',
      videos: [
        Video(title: 'Layouts', url: 'bNn0gO0X4IM'),
        Video(title: 'Widgets', url: 'bNn0gO0X4IM'),
      ],
      pdfs: [],
    ),
    Module(
      title: 'Building UIs',
      videos: [
        Video(title: 'Layouts', url: 'bNn0gO0X4IM'),
        Video(title: 'Widgets', url: 'bNn0gO0X4IM'),
      ],
      pdfs: [],
    ),
    Module(
      title: 'Building UIs',
      videos: [
        Video(title: 'Layouts', url: 'bNn0gO0X4IM'),
        Video(title: 'Widgets', url: 'bNn0gO0X4IM'),
      ],
      pdfs: [],
    ),
    Module(
      title: 'Building UIs',
      videos: [
        Video(title: 'Layouts', url: 'bNn0gO0X4IM'),
        Video(title: 'Widgets', url: 'bNn0gO0X4IM'),
      ],
      pdfs: [],
    ),
    Module(
      title: 'Building UIs',
      videos: [
        Video(title: 'Layouts', url: 'bNn0gO0X4IM'),
        Video(title: 'Widgets', url: 'bNn0gO0X4IM'),
      ],
      pdfs: [],
    ),
    Module(
      title: 'Building UIs',
      videos: [
        Video(title: 'Layouts', url: 'bNn0gO0X4IM'),
        Video(title: 'Widgets', url: 'bNn0gO0X4IM'),
      ],
      pdfs: [],
    ),
    Module(
      title: 'Building UIs',
      videos: [
        Video(title: 'Layouts', url: 'bNn0gO0X4IM'),
        Video(title: 'Widgets', url: 'bNn0gO0X4IM'),
      ],
      pdfs: [],
    ),
    Module(
      title: 'Building UIs',
      videos: [
        Video(title: 'Layouts', url: 'bNn0gO0X4IM'),
        Video(title: 'Widgets', url: 'bNn0gO0X4IM'),
      ],
      pdfs: [],
    ),
  ],
);
