
import 'package:cleaning_app/models/user_data.dart';
import 'package:cleaning_app/screens/home.dart';
import 'package:cleaning_app/screens/login.dart';
import 'package:cleaning_app/services/authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Chef>(
        stream: AuthService().user,
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Login();
          } else {
            return Home();
          }
        });
  }
}
