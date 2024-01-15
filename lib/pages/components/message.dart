import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Message {
  final String senderid;
  final String sendermail;
  final String recieverid;
  final String message;
  final Timestamp timestamp;
  Message(
      {required this.senderid,
      required this.sendermail,
      required this.recieverid,
      required this.message,
      required this.timestamp});

  Map<String, dynamic> tomap() {
    return {
      'senderid': senderid,
      'sendermail': sendermail,
      'message': message,
      'timestamp': timestamp,
      'recieverid': recieverid
    };
  }
}
