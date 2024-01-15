import 'package:chatapp/pages/components/realtextfield.dart';
import 'package:chatapp/pages/services/authenticate.dart';
import 'package:chatapp/pages/services/authservice.dart';
import 'package:chatapp/pages/services/chat/chat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class chatpage extends StatelessWidget {
  final String reciever;
  final String recieverid;

  chatpage({super.key, required this.reciever, required this.recieverid});
  final TextEditingController real = TextEditingController();
  final chatService _chatservice = chatService();
  final Authservice authu = Authservice();

  void sendmessage() async {
    if (real.text.isNotEmpty) {
      await _chatservice.sendmessage(recieverid, real.text);
    }
    real.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          children: [Expanded(child: buildmessagelist()), builduserinput()]),
      appBar: AppBar(
        title: Text(reciever),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }

  Widget buildmessagelist() {
    String senderid = authu.getcurret()!.uid;
    return StreamBuilder(
        stream: _chatservice.getmessage(recieverid, senderid),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text("Error");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Waiting");
          }
          return ListView(
            children: snapshot.data!.docs
                .map((doc) => buildmessageitem(doc))
                .toList(),
          );
        });
  }

  Widget buildmessageitem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Text(data['message']);
  }

  Widget builduserinput() {
    return Row(
      children: [
        Expanded(
            child: realtextfield(
          controller: real,
          hintText: "Type a message",
          obscuretext: false,
        )),
        IconButton(onPressed: sendmessage, icon: Icon(Icons.arrow_upward))
      ],
    );
  }
}
