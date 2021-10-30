import 'package:cleaning_app/consts/colors.dart';
import 'package:cleaning_app/screens/home.dart';
import 'package:cleaning_app/shared/default_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../shared/free_scaffold.dart';

class Intro extends StatefulWidget {


  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    List titles = const [
      Text(
        'Welcome to Cleaning app',
        textAlign: TextAlign.center,
        style:
        TextStyle(fontSize: 34),
      ),
      Text(
        'We offer different services',
        textAlign: TextAlign.center,

        style:
        TextStyle(fontSize: 34),
      ),
      Text(
        'Clean your home or office',
        textAlign: TextAlign.center,

        style:
        TextStyle(fontSize: 34),
      ),
      Text(
        'Clean every thing with a single click',
        textAlign: TextAlign.center,

        style:
        TextStyle(fontSize: 34),
      ),
    ];



    List svgImages = [
      'assets/app_logo.svg',
      'assets/intro_1.svg',
      'assets/intro_2.svg',
      'assets/intro_3.svg',
    ];

    return SafeArea(
      child: FreeScaffold(
          background: [

            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: SizedBox(
                    width: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: index == 0
                                ? primaryColor
                                : const Color(0xFFC1C1C1),
                          ),
                        ),
                        Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: index == 1
                                ? primaryColor
                                : const Color(0xFFC1C1C1),
                          ),
                        ),
                        Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: index == 2
                                ? primaryColor
                                : const Color(0xFFC1C1C1),
                          ),
                        ),
                        Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: index == 3
                                ? primaryColor
                                : const Color(0xFFC1C1C1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
          scaffold: Scaffold(
            body: SizedBox(
              height: size.height,
              width: size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        height:  100,
                      ),
                      titles[index],
                      const SizedBox(
                        height: 20,
                      ),

                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                    ],
                  ),
                  Padding(
                      padding:
                      EdgeInsets.symmetric(horizontal: size.width * 0.13),
                      child: SvgPicture.asset(
                        svgImages[index],
                        height: size.width * 0.6,
                        width: size.width * 0.6,
                      )
                         ),
                  const SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    width: size.width * 0.54,
                    child: defaultButton(
                        onPressed: () {

                          setState(() {
                            if (index == 3) {
                              Get.to(()=>Home());
                            } else {
                              index++;
                            }
                          });
                        },
                        text: index == 0
                            ? 'Get started'
                            : '',
                        rounded: true,
                        showArrow: index != 0,
                        centerText: true,
                        color:  primaryColor,
                        textStyle: const TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(
                    height: 50 ,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
