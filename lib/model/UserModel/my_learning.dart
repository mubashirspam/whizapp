class MyLearning {
  String? courseId;
  int? progress;

  MyLearning({this.courseId, this.progress});

  factory MyLearning.fromJson(Map<String, dynamic> json) => MyLearning(
        courseId: json['courseId'].toString(),
        progress: json['progress'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'courseId': courseId,
        'progress': progress,
      };
}
