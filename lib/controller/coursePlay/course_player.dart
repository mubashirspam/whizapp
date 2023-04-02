import 'dart:developer';

import 'package:get/get.dart';
import 'package:pod_player/pod_player.dart';
import 'package:whizapp/model/course/course_mode.dart';

class CoursePlayerController extends GetxController {
  PodPlayerController? podcontroller;

  List<Video> videos = [];
  int currenVideoIndex = 0;
  RxInt currentModuleIndex = 0.obs;
  RxBool isVideoPlaying = false.obs;

  Rxn<CourseModel> courseModel = Rxn();
  bool isFinished = false;
  Rxn<Video> currentVideo = Rxn();
  Rxn<Module> currentModule = Rxn();
//super methods=================

  @override
  void onClose() {
    log('remove listner called ==================');
    podcontroller?.dispose();

    super.onClose();
  }

//methods ==========================
  void initializeYtPlay() {
    if (videos.isNotEmpty) {
      log('initialize called -----------!!!!!!!!!!!!!!!!!!!');
      podcontroller = PodPlayerController(
          playVideoFrom: PlayVideoFrom.youtube(videos[currenVideoIndex].url),
          podPlayerConfig: const PodPlayerConfig(
              autoPlay: false,
              videoQualityPriority: [240, 360, 480, 720, 1080]))
        ..initialise().then((value) {
          //  listenVideoStatus();
          checksforQualityChange();
        });
    }
  }

  void extractVideosFromCourse(CourseModel course) {
    courseModel(course);
    for (Module module in course.modules) {
      for (Video video in module.videos) {
        videos.add(video);
      }
    }
    log(videos.length.toString() + "------------");
  }

  void listenVideoStatus() {
    if (videos.isNotEmpty) {
      currentVideo.value = videos[currenVideoIndex];

      podcontroller?.addListener(() {
        log('listening =====================');
        isVideoPlaying(podcontroller?.isVideoPlaying);
        if ((podcontroller?.currentVideoPosition.inSeconds ==
                podcontroller?.totalVideoLength.inSeconds) &&
            isFinished == false) {
          //checking the duration and position every time
          isFinished = true;

          playNext();
        }
      });
    }
  }

  void checksforQualityChange() {
    podcontroller?.onVideoQualityChanged(() {
      listenVideoStatus();
      log('quality changed -----------------');
    });
  }

  void findModuleIndex() {
    log('find module index============');
    for (int i = 0; i < courseModel.value!.modules.length; i++) {
      for (int j = 0; j < courseModel.value!.modules[i].videos.length; j++) {
        if (courseModel.value!.modules[i].videos[j].url ==
            videos[currenVideoIndex].url) {
          log('index =============$i');
          currentModuleIndex(i);
        }
      }
    }
  }

  void playNext() {
    log('playnext -----------------------------');
    currenVideoIndex = currenVideoIndex + 1;
    if (videos.length > currenVideoIndex) {
      findModuleIndex();
      podcontroller
          ?.changeVideo(
              playVideoFrom:
                  PlayVideoFrom.youtube(videos[currenVideoIndex].url),
              playerConfig: const PodPlayerConfig(
                  autoPlay: false,
                  videoQualityPriority: [240, 360, 480, 720, 1080]))
          .then((value) {
        isFinished = false;
        listenVideoStatus();
      });
    }
  }

  int getCurrentVideoIndex(String url) {
    return videos.indexWhere((element) => element.url == url);
  }

  void changeVideo(String url) {
    currenVideoIndex = getCurrentVideoIndex(url);
    findModuleIndex();

    podcontroller
        ?.changeVideo(
      playVideoFrom: PlayVideoFrom.youtube(videos[currenVideoIndex].url),
    )
        .then((value) {
      isFinished = false;
      listenVideoStatus();
    });
  }
}
