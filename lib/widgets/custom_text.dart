import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? size;
  final Color? color;
  final FontWeight? weight;
  final TextAlign? align;

  CustomText(this.text, {this.size, this.color, this.weight, this.align});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      //todo: customize font!
      style: GoogleFonts.roboto(
          textStyle: TextStyle(
              fontWeight: weight ?? FontWeight.normal,
              fontSize: size ?? 16,
              color: color ?? Colors.black)),
      textAlign: align ?? TextAlign.left,
    );
  }
}
