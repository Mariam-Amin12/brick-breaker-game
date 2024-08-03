// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CoverScreen extends StatelessWidget {

  final bool hasStarted;

  const CoverScreen({super.key, required this.hasStarted});

  @override
  Widget build(BuildContext context) {
    return hasStarted?Container():Container(
      alignment:const Alignment(0, -0.2),
      child: Text(
        "Tap to start",
        style: TextStyle(
          color: Colors.deepOrange,
          fontSize: MediaQuery.of(context).size.width * .06,
        )
      ),
    );
  }
}
