import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:get/get.dart';
import 'package:whizapp/model/course/course_mode.dart';

class FirestoreService {
  final CollectionReference _coursesCollection =
      FirebaseFirestore.instance.collection('courses');

  Future<void> createCourse(CourseModel course) async {
    try {
      var docRef = _coursesCollection.doc();
      course.id = docRef.id;
      docRef.set(course.toMap());
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
      final QuerySnapshot<Map<String, dynamic>> coursesQuery = await _firestore
          .collection('courses')
          .where('isPrivate', isEqualTo: false)
         
          .limit(2)
          .get();
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
  id: '',
  name: 'NLP ',
  description: 'Learn NLP',
  rating: 4.5,

  comments: [
    Comment(author: 'John Doe', text: 'Great course!'),
    Comment(author: 'Jane Smith', text: 'Very helpful'),
  ],
  modules: [
    Module(
      title: 'Getting Started Class and Objects',
      videos: [
        Video(title: 'Introduction', url: 'https://example.com/video2'),
        Video(
            title: 'Setting up the environment',
            url: 'https://example.com/video1'),
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
  createdAt: DateTime.now(),
  updatedAt: DateTime.now(),
  createdBy: "Bisher",
  isPrivate: false,
  totalDuration: '34',
  thumbnailUrl: '',
);
