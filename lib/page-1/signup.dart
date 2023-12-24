import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myapp/page-1/UserModel.dart';
import 'package:myapp/page-1/login.dart';

import 'package:myapp/utils.dart';

class SignUP extends StatefulWidget {
  @override
  State<SignUP> createState() => _LoginState();
}

class _LoginState extends State<SignUP> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  bool rememberUser = false;
  late Size mediaSize;
  final FirebaseAuth auth = FirebaseAuth.instance;

  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    double baseWidth = 393;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    mediaSize = MediaQuery.of(context).size;

    Future<User?> signInWithEmailAndPassword(
        String email, String password) async {
      try {
        UserCredential result = await auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        User? user = result.user;
        return user;
      } catch (error) {
        print(error.toString());
        return null;
      }
    }

    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 62, 86, 44),
        image: DecorationImage(
          image: const AssetImage('assets/page-1/images/rectangle-9-bg.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(children: [
          Positioned(bottom: 0, child: _buildBottom()),
        ]),
      ),
    );
  }

  Widget _buildBottom() {
    return SizedBox(
      width: mediaSize.width,
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        )),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: _buildForm(),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 58.0),
          child: Text(
            "Welcome",
            style: TextStyle(
                color: Color.fromARGB(255, 59, 95, 43),
                fontSize: 34,
                fontWeight: FontWeight.w500),
          ),
        ),
        _buildGreyText("Please register with your information"),
        _buildGreyText("UserName"),
        _buildInputField(usernameController),
        const SizedBox(height: 30),
        _buildGreyText("Email address"),
        _buildInputField(emailController),
        const SizedBox(height: 30),
        _buildGreyText("Password"),
        _buildInputField(passwordController, isPassword: true),
        const SizedBox(height: 20),
        _buildLoginButton(),
      ],
    );
  }

  Widget _buildGreyText(String text) {
    return Text(
      text,
      style: const TextStyle(color: Colors.grey),
    );
  }

  Widget _buildInputField(TextEditingController controller,
      {isPassword = false}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: isPassword ? Icon(Icons.remove_red_eye) : Icon(Icons.done),
      ),
      obscureText: isPassword,
    );
  }

  Widget _buildLoginButton() {
    return ElevatedButton(
      onPressed: () {
        auth
            .createUserWithEmailAndPassword(
                email: emailController.text, password: passwordController.text)
            .then((value) {
          UserModel user = UserModel(
            username: usernameController.text,
            uid: value.user!.uid,
            email: emailController.text,
          );
          users.add({
            'username': user.username,
            'uid': user.uid,
            'email': user.email,
          }).then((value) {
            print('User added with ID: ${value.id}');
          }).catchError((error) {
            print('Error adding user: $error');
          });
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Login()));
        }).onError((error, stackTrace) {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("Error"),
                  content: Text(
                      "Weak Password \n The password must be 6 characters long or more."),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("OK"))
                  ],
                );
              });
        });
      },
      style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          elevation: 20,
          shadowColor: Colors.grey,
          minimumSize: const Size.fromHeight(60),
          backgroundColor: Color.fromARGB(255, 59, 95, 43)),
      child: const Text("Register",
          style: TextStyle(fontSize: 16, color: Colors.white)),
    );
  }
}
