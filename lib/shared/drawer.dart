import 'package:cleaning_app/consts/colors.dart';
import 'package:cleaning_app/screens/home.dart';
import 'package:cleaning_app/screens/intro.dart';
import 'package:cleaning_app/services/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainDrawer extends StatelessWidget {
  MainDrawer({this.firstName,this.lastName});
  String firstName;
  String lastName;
  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();

    return Drawer(
        child: ListView(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          width: double.infinity,
          color: primaryColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
               CircleAvatar(
                child: Text(
                  '${firstName[0].toUpperCase()}',
                  style: const TextStyle(fontSize: 70, color: primaryColor),
                ),
                backgroundColor: Colors.white,
                radius: 70,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '$firstName $lastName',
                style: const TextStyle(fontSize: 25, color: Colors.white),
              ),
            ],
          ),
        ),
        DrawerCard(
          text: 'Home',
          icon: const Icon(
            Icons.home_outlined,
            color: primaryColor,
            size: 30,
          ),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Home()));
          },
        ),
        DrawerCard(
          text: 'About us',
          icon: const Icon(
            Icons.report_outlined,
            color: primaryColor,
            size: 30,
          ),
          onTap: () {
          Get.to(()=>Intro());
          },
        ),
        DrawerCard(
          text: 'Report a problem',
          icon: const Icon(
            Icons.report_problem_outlined,
            color: primaryColor,
            size: 30,
          ),
          onTap: () {
            /*   Navigator.pop(context);
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Users()));*/
          },
        ),
        DrawerCard(
          text: 'Contact us',
          icon: const Icon(
            Icons.email_outlined,
            color: primaryColor,
            size: 30,
          ),
          onTap: () {
            /*   Navigator.pop(context);
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Users()));*/
          },
        ),
        GestureDetector(
          onTap: () async {
            final FirebaseAuth auth = FirebaseAuth.instance;

            await _auth.signOut();
            Get.back();

          },
          child: const Padding(
            padding: EdgeInsets.all(5),
            child: ListTile(
              leading: Icon(
                Icons.logout,
                color: Colors.red,
                size: 30,
              ),
              title: Text(
                'log out',
                style: TextStyle(fontSize: 18,color: Colors.red),
              ),
            ),
          ),
        )
      ],
    ));
  }
}

class DrawerCard extends StatelessWidget {
  final Function onTap;
  final Icon icon;
  final String text;

  const DrawerCard({
    this.onTap,
    this.icon,
    this.text,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: ListTile(
          leading: icon,
          title: Text(
            text,
            style: const  TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
