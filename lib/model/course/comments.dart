import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';


//dynamic field so name is Message id
class MessageId {
  Message? message;
  String? messageId;
  MessageId({this.message, this.messageId});

 /*  MessageId.fromJson(Map<String, dynamic> json) {
    MessageId = json.keys.map((MessageIds) => MessageIds).toList().first;
    Message = json.keys.map((MessageIds) => json[MessageIds]).toList().first;
  } */
  static List<MessageId> allMessagesFromJson(Map<String, dynamic> ? json) {

    if(json != null){

return json.keys
        .map((messageId) => MessageId(
            message: Message.fromJson(json[messageId]), messageId: messageId))
        .toList();
    }
    else{
      log('json is empty====');
      return [];
    }
    
  }

  Map<String, dynamic> toFirestore() {
    return {messageId!: message?.toJson()};
  }
}



class Message {
  String? userId;
  String? userName;
  DateTime? timestamp;
  String? messageText;

  Message({this.userId, this.userName, this.timestamp, this.messageText});

  Message.fromJson(Map<String, dynamic> json) {
    log(json.toString()+"___________________");
    userId = json['userId'];
    userName = json['userName'];
    timestamp = json['timeStamp'].toDate();
    messageText = json['MessageText'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['userId'] = this.userId;
    data['userName'] = this.userName;
    data['timeStamp'] = Timestamp.fromDate(timestamp!);

    data['MessageText'] = this.messageText;
    return data;
  }
}
