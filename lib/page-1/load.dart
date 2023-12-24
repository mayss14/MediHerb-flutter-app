import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myapp/page-1/login.dart';

class Load extends StatelessWidget {
  const Load({super.key});

  Future<FirebaseApp> initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: initializeFirebase(),
      builder: (context, snapshot) =>
          snapshot.connectionState == ConnectionState.done
              ? Login()
              : Center(
                  child: CircularProgressIndicator(
                      backgroundColor: const Color.fromARGB(255, 53, 101, 55),
                      valueColor: AlwaysStoppedAnimation<Color>(
                          const Color.fromARGB(255, 53, 101, 55))),
                ),
    ));
  }
}
