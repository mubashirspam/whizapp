class Notification {
  String? title;
  String? body;
  String? timeStamp;

  Notification({this.title, this.body, this.timeStamp});

  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
        title: json['title'] as String?,
        body: json['body'] as String?,
        timeStamp: json['timeStamp'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'body': body,
        'timeStamp': timeStamp,
      };
}
