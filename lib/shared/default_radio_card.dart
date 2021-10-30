import 'package:cleaning_app/consts/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget defaultRadioCard({
  @required value,
  @required Function() onTap,
  @required String text,
  @required String image,
  double paddingVertical = 40,
  bool selected = false,
  bool shadow = true,
  bool type = false,
  Widget child,
}) =>
    InkWell(
      onTap: onTap,
      child: Container(
        padding:
            EdgeInsets.symmetric(horizontal: 30, vertical: paddingVertical),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              shadow
                  ? const BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 1),
                      blurRadius: 2)
                  : const BoxShadow(),
            ]),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                type
                    ? Image.asset(
                        image,
                        height: 100,
                        width: 100,
                      )
                    : SvgPicture.asset(
                        image,
                        height: 100,
                        width: 100,
                      ),
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 25),
                ),
                Icon(
                  selected ? Icons.check_circle : Icons.check_circle_outline,
                  size: 27,
                  color: primaryColor,
                )
              ],
            ),
            if(selected && !type) child,
          ],
        ),
      ),
    );
