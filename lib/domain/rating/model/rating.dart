class Ratings {
  double? totalRating;
  int? totalCount;

  Ratings({this.totalRating, this.totalCount});

  factory Ratings.fromJson(Map<String, dynamic> json) => Ratings(
        totalRating: json['totalRating']?.toDouble(),
        totalCount: json['totalCount'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'totalRating': totalRating,
        'totalCount': totalCount,
      };
}
