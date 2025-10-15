import 'package:flutter/material.dart';

Widget buildPage({
  required color,
  required urlImage,
  required title,
  required subtitle
}) =>
 Container(
  color: color,
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(
        urlImage,
        fit: BoxFit.cover,
        width: double.infinity,
      ),const SizedBox(height: 64),
      Text(
        title,
        style: TextStyle(
          color: Colors.teal.shade700,
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
      ),const SizedBox(height: 64),
      Text(
        subtitle,
        style: TextStyle(
          color: Colors.teal.shade700,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      )
    ],
  ),
 );
