import 'package:chatapp/pages/components/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class chatService {
  //get instance of firestore

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth authu = FirebaseAuth.instance;

  //get user stream
  Stream<List<Map<String, dynamic>>> getuserstream() {
    return firestore.collection("Users").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final user = doc.data() as Map<String, dynamic>;
        return user;
      }).toList();
    });
  }

  //send message
  Future<void> sendmessage(String receiverid, String message) async {
    final String currentuserid = authu.currentUser!.uid;
    final String currentmail = authu.currentUser!.email!;
    final Timestamp timestamp = Timestamp.now();

    Message newmessage = Message(
        senderid: currentmail,
        sendermail: currentuserid,
        recieverid: receiverid,
        message: message,
        timestamp: timestamp);

    List<String> ids = [currentuserid, receiverid];
    //get message
    String chatroomid = ids.join('_');
    ids.sort();
    await firestore
        .collection('messages')
        .doc(chatroomid)
        .set(newmessage.tomap());
  }

  Stream<QuerySnapshot> getmessage(String userid, String otheruser) {
    List<String> ids = [userid, otheruser];
    ids.sort();
    String chatroomid = ids.join('_');
    return firestore
        .collection("chatrooms")
        .doc(chatroomid)
        .collection("messages")
        .orderBy("timestamp", descending: false)
        .snapshots();
  }
}
