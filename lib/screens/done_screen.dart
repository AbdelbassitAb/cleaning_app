import 'package:cleaning_app/consts/colors.dart';
import 'package:cleaning_app/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class DoneScreen extends StatefulWidget {
  @override
  _DoneScreenState createState() => _DoneScreenState();
}

class _DoneScreenState extends State<DoneScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Text(
              'We have recieved your order , we will send you workers in your selected day',
              style: TextStyle(fontSize: 34),
            ),
            SvgPicture.asset(
              'assets/done.svg',
              height: MediaQuery.of(context).size.height * 0.5,
            ),

            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: ElevatedButton(
                  style: ButtonStyle(
                      foregroundColor:
                      MaterialStateProperty.all<Color>(
                          Colors.white),
                      backgroundColor:
                      MaterialStateProperty.all<Color>(
                          primaryColor),
                      shape: MaterialStateProperty.all<
                          RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ))),
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: const Text(
                      'Go to home',
                      style: TextStyle(
                          color: Colors.white, fontSize: 25),
                    ),
                  ),
                  onPressed: () {
                    Get.to(() => Home());
                  }),
            ),

          ],
        ),
      ),
    ));
  }
}
