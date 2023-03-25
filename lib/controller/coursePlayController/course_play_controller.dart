import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:whizapp/model/user/user_model.dart';

import '../../model/course/comments.dart';

class CoursePlayController extends GetxController {
  @override
  void onInit() {
    _firebaseFirestore = FirebaseFirestore.instance;
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady

    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    _streamSubscription?.cancel();
    super.onClose();
  }
 bool getStreamStatus(){
  return  _streamSubscription != null ? true:false;
  }

 
  RxBool isSending = false.obs;
    RxBool isDeleting = false.obs;
  late FirebaseFirestore _firebaseFirestore;
  StreamSubscription? _streamSubscription;
  RxList<MessageId> comments = RxList.empty();
  String textFieldValue = '';
  Rx<Option<String>> sucessOrFailure = Rx(none());

  handleSendMessage(UserModel user, String courseId) async {
    final time = DateTime.now();
    final commentId = MessageId(
        messageId: time.millisecondsSinceEpoch.toString(),
        message: Message(
            userId: user.uid,
            userName: user.name,
            timestamp: time,
            messageText: textFieldValue));
            isSending(true);
    sucessOrFailure.value = await sendMessage(courseId, commentId);
     isSending(false);
  }

  handleCommentsStream(String courseId) {
    _streamSubscription?.cancel();
    _streamSubscription = getSingleCommentStream(courseId).listen((commentIds) {
      
        
      comments(commentIds);
    }, onError: (e) {
      log(e.toString() + "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
    });
  }
  handleDeleteMessage(MessageId messageId,String courseId)async{
    isDeleting(true);
sucessOrFailure.value = await deleteComment(messageId, courseId);
isDeleting(false);
  }

  Stream<List<MessageId>> getSingleCommentStream(String courseId) async* {
    yield* _firebaseFirestore
        .collection('comments')
        .doc(courseId.trim())
        .snapshots()
        .map((docSnap) => MessageId.allMessagesFromJson(
            docSnap.data() as Map<String, dynamic>));
  }

  Future<Option<String>> deleteComment(MessageId messageId,String courseId) async {
    try {
      final field ={
      messageId.messageId!: FieldValue.delete()
      };
      await _firebaseFirestore
          .collection('comments')
          .doc(courseId.trim()).update(
field
          );
          
      return none();
    } catch (e) {
      log(e.toString()+" Excep delete Message xxxxxxxxxxxxxxxxxxxxxxxxxxx");
      return Some(e.toString());
    }
  }

  Future<Option<String>> sendMessage(
      String courseId, MessageId commentId) async {
    try {
      await _firebaseFirestore
          .collection('comments')
          .doc(courseId.trim())
          .set(commentId.toFirestore(), SetOptions(merge: true));
      return none();
    } catch (e) {
      log("set Comment Exception ${e.toString()}");
      return Some(e.toString());
    }
  }
}
