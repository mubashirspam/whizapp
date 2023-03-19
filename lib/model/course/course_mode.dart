import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CourseModel {
  String id;
  final String name;
  final String description;
  final double rating;
  final List<Comment> comments;
  final List<Module> modules;
  final String createdBy;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isPrivate;
  final String totalDuration;
  final String thumbnailUrl;

  CourseModel(
      {required this.id,
      required this.name,
      required this.description,
      required this.rating,
      required this.comments,
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
        name: data['name'],
        description: data['description'],
        rating: data['rating'].toDouble(),
        comments: (data['comments'] as List<dynamic>)
            .map((e) => Comment.fromMap(e))
            .toList(),
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
  DateTime ts = DateTime.now();
  Timestamp dT = Timestamp.fromDate(DateTime.now());
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'rating': rating,
      'comments': comments.map((e) => e.toMap()).toList(),
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

class Comment {
  final String author;
  final String text;

  Comment({required this.author, required this.text});

  factory Comment.fromMap(Map<String, dynamic> data) {
    return Comment(
      author: data['author'],
      text: data['text'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'author': author,
      'text': text,
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
