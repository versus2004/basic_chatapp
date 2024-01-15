import 'package:chatapp/pages/Homepage.dart';
import 'package:chatapp/pages/services/loginregister.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class authenticate extends StatelessWidget {
  const authenticate({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomePage();
          } else {
            return LoginRegister();
          }
        },
      ),
    );
  }

  getcurret() {}
}
