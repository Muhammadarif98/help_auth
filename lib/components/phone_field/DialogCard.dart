import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogCard extends StatelessWidget {
  const DialogCard({
    Key? key,
    required this.height,
    required this.width,
    required this.child,
  }) : super(key: key);

  final double height, width;
  final Widget child;

  static const dialogPadding = EdgeInsets.symmetric(
    vertical: 16,
    horizontal: 20,
  );

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
      child: Dialog(
        elevation: 0.5,
        child: Container(
          padding: dialogPadding,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
          ),
          height: height,
          width: width,
          child: child,
        ),
      ),
    );
  }
}