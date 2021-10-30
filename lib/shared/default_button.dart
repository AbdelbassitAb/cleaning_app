import 'dart:math';

import 'package:cleaning_app/consts/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget defaultButton(
    {@required void Function() onPressed,
      String icon = "assets/arrow.svg",
      String text,
      bool reversed = false,
      bool rounded = false,
      bool showArrow = true,
      bool centerText = false,
      Color color = primaryColor,
      String price = '',
      TextStyle textStyle = const TextStyle(
        fontSize: 17,
      )}) =>
    ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            primary: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(rounded ? 33 : 12),
            ),
            padding: EdgeInsets.symmetric(
                horizontal: 22, vertical: text == null ? 20.5 : 17),
            elevation: 0),
        child: Row(
          mainAxisAlignment: text != null && !centerText
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: [
            if (text != null)
              Text(
                text,
                style: textStyle,
              ),
            Text(
              price,
              style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),
            ),
            if (showArrow)
              Transform.rotate(
                angle: reversed ? pi : 0,
                child: SvgPicture.asset(
                  icon,
                  width: rounded ? 63 : 36.18,
                ),
              )
          ],
        ));