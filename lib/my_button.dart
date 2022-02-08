import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  Color buttonColor;
  Color textColor;
  final String buttonText;
  final buttonTabbed;
  MyButton(
      {required this.buttonColor,
      required this.textColor,
      required this.buttonText,
      required this.buttonTabbed,
      });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: buttonTabbed,
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Container(

            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(
                    color: textColor, fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(10)
            ),
          ),

        ),
      ),
    );
  }
}
