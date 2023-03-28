class MyLearning {
  String? courseId;
  String? progress;

  MyLearning({this.courseId, this.progress});

  factory MyLearning.fromJson(Map<String, dynamic> json) => MyLearning(
        courseId: json['courseId'] as String?,
        progress: json['progress'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'courseId': courseId,
        'progress': progress,
      };
}
