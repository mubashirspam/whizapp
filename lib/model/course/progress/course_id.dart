class CourseId {
  CourseProgress? progress;
  String? courseId;
  CourseId({this.courseId, this.progress});
  Map<String, dynamic> toFirestore (){
    return
    {
      courseId!:progress!.toJson()
    };
  }
  static List<CourseId> getAllCourseProgress(Map<String, dynamic>? json) {
    return json!= null ? json.keys
        .map((key) =>
            CourseId(courseId: key, progress: CourseProgress.fromJson(json[key])))
        .toList():[];
  }
}

class CourseProgress {
  int? progress;
  String? courseId;
  double? myRating;

  CourseProgress({this.progress, this.courseId, this.myRating});

  factory CourseProgress.fromJson(Map<String, dynamic> json) => CourseProgress(
        progress: json['progress'] as int?,
        courseId: json['courseId'] as String?,
        myRating: (json['myRating'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'progress': progress,
        'courseId': courseId,
        'myRating': myRating,
      };
}
