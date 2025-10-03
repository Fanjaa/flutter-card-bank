import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  final dynamic backgroundColor;
  final colorLoad;
  const Loading({super.key, required this.backgroundColor, required this.colorLoad,});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      child: Center(
        child: CircularProgressIndicator(color: Colors.blue[800]),
      ),
    );
  }
}
