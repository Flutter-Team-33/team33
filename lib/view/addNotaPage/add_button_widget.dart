import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:team33_app/components/color.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    required this.text,
    required this.onClicked,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onClicked,
        splashColor: Colors.transparent,

        //highlightColor: Colors.transparent,
        child: GestureDetector(
          child: Transform.rotate(
            angle: -math.pi / 4,
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: white.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 15,
                    offset: Offset(0, 1)),
              ], color: grimsi, borderRadius: BorderRadius.circular(23)),
              child: Transform.rotate(
                angle: -math.pi / 4,
                child: Center(
                    child: Icon(
                  Icons.add_circle_outline,
                  color: white,
                  size: 26,
                )),
              ),
            ),
          ),
        ),
      );
}
