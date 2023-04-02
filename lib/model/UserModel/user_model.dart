import 'dart:developer';

import 'my_learning.dart';
import 'notification.dart';

class UserModel {
  String name;
  DateTime dob;
  String phoneNumber;
  String studentClass;
  String uid;
  List<Notification> notifications;
  List<MyLearning> myLearnings;
  String profileImageUrl;

  UserModel({
    required this.name,
    required this.dob,
    required this.phoneNumber,
    required this.studentClass,
    required this.uid,
    required this.notifications,
    required this.myLearnings,
    required this.profileImageUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
   
    return UserModel(
      name: json['name'],
      dob: json['dob'].toDate(),
      phoneNumber: json['phoneNumber'],
      studentClass: json['StudentClass'],
      uid: json['uid'],
      notifications: json['notifications']
          .map<Notification>(
              (e) => Notification.fromJson(e as Map<String, dynamic>))
          .toList(),
      myLearnings: json['myLearnings']
          .map<MyLearning>(
              (e) => MyLearning.fromJson(e as Map<String, dynamic>))
          .toList(),
      profileImageUrl: json['profileImageUrl'],
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'dob': dob,
        'phoneNumber': phoneNumber,
        'StudentClass': studentClass,
        'uid': uid,
        'notifications': notifications.map((e) => e.toJson()).toList(),
        'myLearnings': myLearnings.map((e) => e.toJson()).toList(),
        'profileImageUrl': profileImageUrl
      };
}
