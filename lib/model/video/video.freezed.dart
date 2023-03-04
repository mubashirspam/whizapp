// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Video {
  int get videoId => throw _privateConstructorUsedError;
  String get videoUrl => throw _privateConstructorUsedError;
  int get viewCounts => throw _privateConstructorUsedError;
  String get videoName => throw _privateConstructorUsedError;
  String get videoDescription => throw _privateConstructorUsedError;
  String get videoCreator => throw _privateConstructorUsedError;
  Float get videoRating => throw _privateConstructorUsedError;
  Duration get videoDuration => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VideoCopyWith<Video> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoCopyWith<$Res> {
  factory $VideoCopyWith(Video value, $Res Function(Video) then) =
      _$VideoCopyWithImpl<$Res, Video>;
  @useResult
  $Res call(
      {int videoId,
      String videoUrl,
      int viewCounts,
      String videoName,
      String videoDescription,
      String videoCreator,
      Float videoRating,
      Duration videoDuration});
}

/// @nodoc
class _$VideoCopyWithImpl<$Res, $Val extends Video>
    implements $VideoCopyWith<$Res> {
  _$VideoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? videoId = null,
    Object? videoUrl = null,
    Object? viewCounts = null,
    Object? videoName = null,
    Object? videoDescription = null,
    Object? videoCreator = null,
    Object? videoRating = null,
    Object? videoDuration = null,
  }) {
    return _then(_value.copyWith(
      videoId: null == videoId
          ? _value.videoId
          : videoId // ignore: cast_nullable_to_non_nullable
              as int,
      videoUrl: null == videoUrl
          ? _value.videoUrl
          : videoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      viewCounts: null == viewCounts
          ? _value.viewCounts
          : viewCounts // ignore: cast_nullable_to_non_nullable
              as int,
      videoName: null == videoName
          ? _value.videoName
          : videoName // ignore: cast_nullable_to_non_nullable
              as String,
      videoDescription: null == videoDescription
          ? _value.videoDescription
          : videoDescription // ignore: cast_nullable_to_non_nullable
              as String,
      videoCreator: null == videoCreator
          ? _value.videoCreator
          : videoCreator // ignore: cast_nullable_to_non_nullable
              as String,
      videoRating: null == videoRating
          ? _value.videoRating
          : videoRating // ignore: cast_nullable_to_non_nullable
              as Float,
      videoDuration: null == videoDuration
          ? _value.videoDuration
          : videoDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_VideoCopyWith<$Res> implements $VideoCopyWith<$Res> {
  factory _$$_VideoCopyWith(_$_Video value, $Res Function(_$_Video) then) =
      __$$_VideoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int videoId,
      String videoUrl,
      int viewCounts,
      String videoName,
      String videoDescription,
      String videoCreator,
      Float videoRating,
      Duration videoDuration});
}

/// @nodoc
class __$$_VideoCopyWithImpl<$Res> extends _$VideoCopyWithImpl<$Res, _$_Video>
    implements _$$_VideoCopyWith<$Res> {
  __$$_VideoCopyWithImpl(_$_Video _value, $Res Function(_$_Video) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? videoId = null,
    Object? videoUrl = null,
    Object? viewCounts = null,
    Object? videoName = null,
    Object? videoDescription = null,
    Object? videoCreator = null,
    Object? videoRating = null,
    Object? videoDuration = null,
  }) {
    return _then(_$_Video(
      videoId: null == videoId
          ? _value.videoId
          : videoId // ignore: cast_nullable_to_non_nullable
              as int,
      videoUrl: null == videoUrl
          ? _value.videoUrl
          : videoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      viewCounts: null == viewCounts
          ? _value.viewCounts
          : viewCounts // ignore: cast_nullable_to_non_nullable
              as int,
      videoName: null == videoName
          ? _value.videoName
          : videoName // ignore: cast_nullable_to_non_nullable
              as String,
      videoDescription: null == videoDescription
          ? _value.videoDescription
          : videoDescription // ignore: cast_nullable_to_non_nullable
              as String,
      videoCreator: null == videoCreator
          ? _value.videoCreator
          : videoCreator // ignore: cast_nullable_to_non_nullable
              as String,
      videoRating: null == videoRating
          ? _value.videoRating
          : videoRating // ignore: cast_nullable_to_non_nullable
              as Float,
      videoDuration: null == videoDuration
          ? _value.videoDuration
          : videoDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc

class _$_Video implements _Video {
  const _$_Video(
      {required this.videoId,
      required this.videoUrl,
      required this.viewCounts,
      required this.videoName,
      required this.videoDescription,
      required this.videoCreator,
      required this.videoRating,
      required this.videoDuration});

  @override
  final int videoId;
  @override
  final String videoUrl;
  @override
  final int viewCounts;
  @override
  final String videoName;
  @override
  final String videoDescription;
  @override
  final String videoCreator;
  @override
  final Float videoRating;
  @override
  final Duration videoDuration;

  @override
  String toString() {
    return 'Video(videoId: $videoId, videoUrl: $videoUrl, viewCounts: $viewCounts, videoName: $videoName, videoDescription: $videoDescription, videoCreator: $videoCreator, videoRating: $videoRating, videoDuration: $videoDuration)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Video &&
            (identical(other.videoId, videoId) || other.videoId == videoId) &&
            (identical(other.videoUrl, videoUrl) ||
                other.videoUrl == videoUrl) &&
            (identical(other.viewCounts, viewCounts) ||
                other.viewCounts == viewCounts) &&
            (identical(other.videoName, videoName) ||
                other.videoName == videoName) &&
            (identical(other.videoDescription, videoDescription) ||
                other.videoDescription == videoDescription) &&
            (identical(other.videoCreator, videoCreator) ||
                other.videoCreator == videoCreator) &&
            (identical(other.videoRating, videoRating) ||
                other.videoRating == videoRating) &&
            (identical(other.videoDuration, videoDuration) ||
                other.videoDuration == videoDuration));
  }

  @override
  int get hashCode => Object.hash(runtimeType, videoId, videoUrl, viewCounts,
      videoName, videoDescription, videoCreator, videoRating, videoDuration);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VideoCopyWith<_$_Video> get copyWith =>
      __$$_VideoCopyWithImpl<_$_Video>(this, _$identity);
}

abstract class _Video implements Video {
  const factory _Video(
      {required final int videoId,
      required final String videoUrl,
      required final int viewCounts,
      required final String videoName,
      required final String videoDescription,
      required final String videoCreator,
      required final Float videoRating,
      required final Duration videoDuration}) = _$_Video;

  @override
  int get videoId;
  @override
  String get videoUrl;
  @override
  int get viewCounts;
  @override
  String get videoName;
  @override
  String get videoDescription;
  @override
  String get videoCreator;
  @override
  Float get videoRating;
  @override
  Duration get videoDuration;
  @override
  @JsonKey(ignore: true)
  _$$_VideoCopyWith<_$_Video> get copyWith =>
      throw _privateConstructorUsedError;
}
