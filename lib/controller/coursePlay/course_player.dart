import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pod_player/pod_player.dart';
import 'package:whizapp/model/course/course_mode.dart';

class CoursePlayerController extends GetxController {
  late PodPlayerController podcontroller;

  List<Video> videos = [];
  int currenVideoIndex = 0;

bool isFinished = false;
Rxn<Video>  currentVideo = Rxn() ;
Rxn<Module> currentModule = Rxn();
  void initializeYtPlay() {
    if (videos.isNotEmpty) {
      log('initialize called -----------!!!!!!!!!!!!!!!!!!!');
      podcontroller = PodPlayerController(
          playVideoFrom: PlayVideoFrom.youtube(videos[currenVideoIndex].url),
          podPlayerConfig: const PodPlayerConfig(
              autoPlay: false,
              videoQualityPriority: [144, 360, 480, 720, 1080]))
        ..initialise().then((value) => listenVideoStatus());
    }
  }

  RxBool checkForVideoContain(List<Video> videos ,Video video ){

    return videos.any((element) => element.url == video.url).obs;

  }

  extractVideosFromCourse(CourseModel course) {
    for (Module module in course.modules) {
      for (Video video in module.videos) {
        videos.add(video);
      }
    }
    log(videos.length.toString() + "------------");
  }

  listenVideoStatus() {
       currentVideo.value = videos[currenVideoIndex];
    
    podcontroller.addListener(() {
      log('listening @@@@@@@@@@@@@@@@@@@@@@@@@@');
  
      if ((podcontroller.currentVideoPosition.inSeconds ==
          podcontroller.totalVideoLength.inSeconds)&& isFinished == false) {
        //checking the duration and position every time
        isFinished = true;
    

      
        playNext();
      }
    });
  }

  void playNext() {
    
    currenVideoIndex = currenVideoIndex + 1;
    if(videos.length > currenVideoIndex){
podcontroller.changeVideo(
        playVideoFrom: PlayVideoFrom.youtube(videos[currenVideoIndex].url),
       ).then((value) {
         isFinished = false;
         listenVideoStatus();
       });
    }
    
       
  }
  int getCurrentVideoIndex(String url){
    return
 videos.indexWhere((element) => element.url == url);
  }

  void changeVideo(String url){
    currenVideoIndex = getCurrentVideoIndex(url);

    podcontroller.changeVideo(
        playVideoFrom: PlayVideoFrom.youtube(videos[currenVideoIndex].url),
       ).then((value) {
         isFinished = false;
         listenVideoStatus();
       });
  }

  enableFullScreen(){
    podcontroller.enableFullScreen();
  }
  disableFullScreen(BuildContext context){
    podcontroller.disableFullScreen(context);
  }
}
