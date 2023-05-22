import 'dart:convert';

class ForceUpdate {
  ForceUpdate({
    this.buildNo,
    this.message,
  });

  String? buildNo;
  String? message;

  factory ForceUpdate.fromJson(Map<String, dynamic> json) => ForceUpdate(
        buildNo: json["min_build_no"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "min_build_no": buildNo,
        "message": message,
      };
}
