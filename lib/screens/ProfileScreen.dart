import 'package:belegdb/variables.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String username = '';
  // String firstname = '';
  // String lastname = '';
  String email = '';
  String password = '';
  bool dataisthere = false;
  TextEditingController usernamecontroller = TextEditingController();
  // TextEditingController firstnamecontroller = TextEditingController();
  // TextEditingController lastnamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getuserdata();
  }

  editprofil() async {
    usercollection.doc(FirebaseAuth.instance.currentUser!.uid).update({
      'username': usernamecontroller.text,
      // 'firstname': firstnamecontroller.text,
      // 'lastname': lastnamecontroller.text,
      'email': emailcontroller.text,
      'password': passwordcontroller.text,
    });
    setState(() {
      username = usernamecontroller.text;
      // firstname = usernamecontroller.text;
      // lastname = usernamecontroller.text;
      email = usernamecontroller.text;
      password = usernamecontroller.text;
    });
    Navigator.pop(context);
  }

  getuserdata() async {
    DocumentSnapshot userdoc =
        await usercollection.doc(FirebaseAuth.instance.currentUser!.uid).get();
    setState(() {
      username = userdoc['username'];
      // firstname = userdoc['firstname'];
      // lastname = userdoc['lastname'];
      email = userdoc['email'];
      password = userdoc['password'];
      dataisthere = true;
    });
  }

  onpeneditprofiledialog() async {
    return showDialog(
        context: context,
        builder: (context) {
          return SingleChildScrollView(
            child: Dialog(
              child: Container(
                height: 700,
                child: Column(
                  children: [
                    // SizedBox(
                    //   height: 30,
                    // ),
                    // Container(
                    //   margin: EdgeInsets.only(left: 30, right: 30),
                    //   child: TextField(
                    //     controller: firstnamecontroller,
                    //     style: mystyle(18, Colors.blueGrey),
                    //     decoration: InputDecoration(
                    //         labelText: "Update First Name",
                    //         labelStyle: mystyle(16, Colors.black26)),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 30,
                    // ),
                    // Container(
                    //   margin: EdgeInsets.only(left: 30, right: 30),
                    //   child: TextField(
                    //     controller: lastnamecontroller,
                    //     style: mystyle(18, Colors.blueGrey),
                    //     decoration: InputDecoration(
                    //         labelText: "Update Last Name",
                    //         labelStyle: mystyle(16, Colors.black26)),
                    //   ),
                    // ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 30, right: 30),
                      child: TextField(
                        controller: usernamecontroller,
                        style: mystyle(18, Colors.blueGrey),
                        decoration: InputDecoration(
                            labelText: "Update Username",
                            labelStyle: mystyle(16, Colors.black26)),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 30, right: 30),
                      child: TextField(
                        controller: emailcontroller,
                        style: mystyle(18, Colors.blueGrey),
                        decoration: InputDecoration(
                            labelText: "Update Email",
                            labelStyle: mystyle(16, Colors.black26)),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 30, right: 30),
                      child: TextField(
                        controller: passwordcontroller,
                        style: mystyle(18, Colors.blueGrey),
                        decoration: InputDecoration(
                            labelText: "Update Password",
                            labelStyle: mystyle(16, Colors.black26)),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    InkWell(
                      onTap: () => editprofil(),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: 40,
                        decoration: BoxDecoration(
                          gradient:
                              LinearGradient(colors: GradientColors.cherryNew),
                        ),
                        child: Center(
                          child: Text(
                            "Update Profil",
                            style: mystyle(17, Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: dataisthere == false
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Stack(
              children: [
                ClipPath(
                  clipper: OvalBottomBorderClipper(),
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 2.5,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: GradientColors.facebookMessenger),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 2 - 64,
                    top: MediaQuery.of(context).size.height / 3.1,
                  ),
                  child: CircleAvatar(
                    radius: 64,
                    backgroundImage: NetworkImage(
                        'https://w7.pngwing.com/pngs/178/595/png-transparent-user-profile-computer-icons-login-user-avatars.png'),
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 300,
                      ),
                      Text(
                        username,
                        style: mystyle(40, Colors.black),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        onTap: () => onpeneditprofiledialog(),
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2,
                          height: 40,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: GradientColors.cherryNew),
                          ),
                          child: Center(
                            child: Text(
                              "Edit Profil",
                              style: mystyle(17, Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
