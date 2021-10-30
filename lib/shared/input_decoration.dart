import 'package:cleaning_app/consts/colors.dart';
import 'package:flutter/material.dart';

InputDecoration textinputDecoration = InputDecoration(
  contentPadding: const EdgeInsets.all(4.0),
  fillColor: Colors.white,
  filled: true,
  hintStyle: const TextStyle(
    color: Colors.grey,
  ),


  focusedBorder: OutlineInputBorder(
    borderSide: const BorderSide(
      color: primaryColor,
      width: 2.0,
    ),
    borderRadius: BorderRadius.circular(10),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: const BorderSide(
      color: primaryColor,
      width: 2.0,
    ),
    borderRadius: BorderRadius.circular(10),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderSide: const BorderSide(
      color: Colors.red,
      width: 2.0,
    ),
    borderRadius: BorderRadius.circular(10),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: const BorderSide(
      color: Colors.red,
      width: 2.0,
    ),
    borderRadius: BorderRadius.circular(10),
  ),
);
