import 'package:chatapp/pages/chatpage.dart';
import 'package:chatapp/pages/components/realdrawer.dart';
import 'package:chatapp/pages/components/user.dart';
import 'package:chatapp/pages/services/authenticate.dart';
import 'package:chatapp/pages/services/authservice.dart';
import 'package:chatapp/pages/services/chat/chat.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void signOut() {
    final authservice = Provider.of<Authservice>(context, listen: false);
    authservice.signOut();
  }

  final chatService _chatservice = chatService();
  final authenticate _authservice = authenticate();
  final Authservice real = Authservice();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: builduserlist(),
      backgroundColor: Colors.grey[250],
      drawer: realdrawer(),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[200],
        title: const Center(child: Text('Homepage')),
        actions: [
          IconButton(onPressed: signOut, icon: const Icon(Icons.logout))
        ],
      ),
    );
  }

  Widget builduserlist() {
    return StreamBuilder(
      stream: _chatservice.getuserstream(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text("Error");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }
        return ListView(
          children: snapshot.data!
              .map<Widget>((userdata) => builduserlistItem(userdata, context))
              .toList(),
        );
      },
    );
  }

  Widget builduserlistItem(
      Map<String, dynamic> userdata, BuildContext context) {
    // Display all users except the current one
    if (userdata["email"] != real.getcurret()!.email) {
      return user(
        text: userdata["Email"],
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => chatpage(
                      reciever: userdata["Email"],
                      recieverid: userdata['uid'],
                    )),
          );
        },
      );
    } else {
      return Container();
    }
  }
}
