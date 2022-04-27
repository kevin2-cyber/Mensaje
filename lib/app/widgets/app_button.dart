import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.btnText,
    required this.btnColor,
    required this.onTap,
  }) :  super(key: key);

  final String btnText;
  final Color btnColor;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.blue.shade300,
      onPressed: onTap,
      child: Text(
          btnText,
        style: GoogleFonts.poppins(),
      ),
    );
  }
}