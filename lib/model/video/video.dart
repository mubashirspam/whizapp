import 'dart:ffi';

import 'package:freezed_annotation/freezed_annotation.dart';
part 'video.freezed.dart';
@freezed
class Video with _$Video{
  const factory Video({
    required int videoId,
    required String videoUrl,
    required int viewCounts,
    required String videoName,
    required String videoDescription,
    required String videoCreator,
    required Float videoRating,
    required Duration videoDuration

  }) = _Video;
}