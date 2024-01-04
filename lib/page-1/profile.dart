import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/page-1/UserModel.dart';
import 'package:myapp/page-1/catalogue.dart';
import 'package:myapp/page-1/multiselect.dart';

class UserProfile extends StatefulWidget {
  UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  List<String> selectedItems = [];

  void _showMultiSelect() async {
    final items = <String>[
      'Diabète',
      'Hypertension',
      'Maladies cardiovasculaires',
      'Maladies respiratoires',
      'Cancer',
      'Rhumes'
          'Maladies chroniques',
      'Indigestion'
          'Maladies infectieuses',
      'insomnie',
      'Stress',
      'Anxiété',
    ];

    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(items: items);
      },
    );
    if (results != null) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 393;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    FirebaseAuth auth = FirebaseAuth.instance;

    return FutureBuilder<UserModel?>(
      future: getCurrentUser(auth.currentUser!.uid),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError || snapshot.data == null) {
          return Text('Error loading user profile');
        } else {
          UserModel user = snapshot.data!;
          return Material(
            child: Container(
              padding: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 57 * fem),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xffffffff),
                borderRadius: BorderRadius.circular(20 * fem),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 18 * fem, 22 * fem),
                    padding: EdgeInsets.fromLTRB(
                        20 * fem, 23 * fem, 138 * fem, 14 * fem),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xffffffff),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back),
                          color: Color.fromARGB(255, 33, 49, 23),
                          iconSize: 32,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Catalogue()),
                            );
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 40.0, left: 75),
                          child: Text(
                            'My Profile',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.48 * fem,
                              color: Color.fromARGB(255, 33, 49, 23),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        133 * fem, 0 * fem, 150 * fem, 35 * fem),
                    width: double.infinity,
                    height: 110 * fem,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(55 * fem),
                      color: Color(0xffd9d9d9),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          'assets/page-1/images/ellipse-8-bg.png',
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        20 * fem, 0 * fem, 38 * fem, 25 * fem),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(2, 0, 0, 10),
                          child: Text(
                            'Full Name',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffc4c4c4),
                            ),
                          ),
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              user.username,
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 16 * ffem,
                                  fontWeight: FontWeight.w500,
                                  height: 1.6649999619 * ffem / fem,
                                  letterSpacing: 0.48 * fem,
                                  color: Color.fromARGB(255, 13, 13, 13)),
                            ),
                          ),
                          width: 400,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 191, 228, 191),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(21 * fem, 0 * fem, 37 * fem, 0),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              2 * fem, 0 * fem, 0 * fem, 22),
                          child: Text(
                            'Email Address',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              height: 1.6999999455 * ffem / fem,
                              color: Color(0xffc4c4c4),
                            ),
                          ),
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              user.email,
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 16 * ffem,
                                  fontWeight: FontWeight.w500,
                                  height: 1.6649999619 * ffem / fem,
                                  letterSpacing: 0.48 * fem,
                                  color: Color.fromARGB(255, 13, 13, 13)),
                            ),
                          ),
                          width: 400,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 191, 228, 191),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        15 * fem, 50 * fem, 33 * fem, 0 * fem),
                    width: double.infinity,
                    height: 55 * fem,
                    child: Center(
                      child: ElevatedButton(
                        onPressed: _showMultiSelect,
                        child: Row(
                          children: [
                            Icon(Icons.search_rounded),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: const Text('Set Health Needs',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 48, 92, 46),
                          onPrimary: Colors.white,
                          minimumSize: Size(150, 55),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}

Future<UserModel> getCurrentUser(String uid) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  try {
    QuerySnapshot<Map<String, dynamic>> userSnapshot = await firestore
        .collection('users')
        .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    if (userSnapshot.docs.isNotEmpty) {
      DocumentSnapshot<Map<String, dynamic>> userDocument =
          userSnapshot.docs[0];
      Map<String, dynamic> userData =
          userDocument.data() as Map<String, dynamic>;

      return UserModel(
          username: userData['username'],
          email: userData['email'],
          uid: userData['uid']);
    } else {
      print('User not found with UID: $uid');
      return UserModel(email: "", uid: "", username: "");
    }
  } catch (e) {
    print('Error fetching user: $e');
    return UserModel(email: "", uid: "", username: "");
  }
}
