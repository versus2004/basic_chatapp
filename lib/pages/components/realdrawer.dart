import 'package:chatapp/pages/Homepage.dart';
import 'package:chatapp/pages/services/authservice.dart';
import 'package:chatapp/pages/settingspage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class realdrawer extends StatelessWidget {
  const realdrawer({Key? key});

  void signOut(BuildContext context) {
    final authserive = Provider.of<Authservice>(context, listen: false);
    authserive.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DrawerHeader(
            child: Center(
              child: Icon(
                Icons.message,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text("H O M E"),
              leading: Icon(Icons.home),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
            ),
          ),
          const SizedBox(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text("S E T T I N G S"),
              leading: Icon(Icons.settings),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingsPage()));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0, top: 400, left: 20),
            child: ListTile(
              title: Text("L O G O U T"),
              leading: Icon(Icons.logout),
              onTap: () => signOut(context),
            ),
          ),
        ],
      ),
    );
  }
}
