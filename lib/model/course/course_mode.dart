import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:whizapp/model/course/ratings.dart';

class CourseModel {
  String id;
  final String name;
  final String description;

  final Ratings ratings;
  final List<Module> modules;
  final String createdBy;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isPrivate;
  final String totalDuration;
  final String thumbnailUrl;

  CourseModel(
      {required this.id,
      required this.ratings,
      required this.name,
      required this.description,
      required this.modules,
      required this.createdBy,
      required this.createdAt,
      required this.updatedAt,
      required this.isPrivate,
      required this.totalDuration,
      required this.thumbnailUrl});

  factory CourseModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;

    return CourseModel(
        id: doc.id,
        ratings: Ratings.fromJson(data['ratings']),
        name: data['name'],
        description: data['description'],
        modules: (data['modules'] as List<dynamic>)
            .map((e) => Module.fromMap(e))
            .toList(),
        createdBy: data['createdBy'],
        createdAt: data['createdAt'].toDate(), //dateTime
        updatedAt: data['updatedAt'].toDate(), //dateTime
        isPrivate: data['isPrivate'], //bool
        totalDuration: data['totalDuration'], //String
        thumbnailUrl: data['thumbnailUrl']);
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'ratings': ratings,
      'description': description,
      'modules': modules.map((e) => e.toMap()).toList(),
      'createdBy': createdBy,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
      'isPrivate': isPrivate,
      'totalDuration': totalDuration,
      'thumbnailUrl': thumbnailUrl
    };
  }
}

class Module {
  final String title;
  final List<Video> videos;
  final List<PDF> pdfs;

  Module({required this.title, required this.videos, required this.pdfs});

  factory Module.fromMap(Map<String, dynamic> data) {
    return Module(
      title: data['title'],
      videos: (data['videos'] as List<dynamic>)
          .map((e) => Video.fromMap(e))
          .toList(),
      pdfs: (data['pdfs'] as List<dynamic>).map((e) => PDF.fromMap(e)).toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'videos': videos.map((e) => e.toMap()).toList(),
      'pdfs': pdfs.map((e) => e.toMap()).toList(),
    };
  }
}

class Video {
  final String title;
  final String url;

  Video({required this.title, required this.url});

  factory Video.fromMap(Map<String, dynamic> data) {
    return Video(
      title: data['title'],
      url: data['url'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'url': url,
    };
  }
}

class PDF {
  final String title;
  final String url;

  PDF({required this.title, required this.url});

  factory PDF.fromMap(Map<String, dynamic> data) {
    return PDF(
      title: data['title'],
      url: data['url'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'url': url,
    };
  }
}
