import 'package:flutter/material.dart';

//TODO: remove unnecessary stuff

const Color primary = Colors.black;
const red = Colors.red;
const Color white = Colors.white;
const Color black = Colors.black;
const Color grey = Colors.grey;
const Color green = Colors.green;
const Color active = Colors.orange;
const Color disabled = Colors.grey;

//#8880ff - фиолетовый
//#ffa06a - оранжевый
//#ffb5b2 - розовый
//#ffd986 - желтый
//const Color themePurple = Color.fromARGB(255, 136, 128, 255);
const Color themeOrange = Color.fromARGB(255, 255, 160, 106);
const Color themeDeepOrange = Color.fromARGB(255, 255, 138, 101);
//const Color themePink = Color.fromARGB(255, 255, 181, 178);
//const Color themePink = Color.fromARGB(255, 255, 111, 111);
const Color themeYellow = Color.fromARGB(255, 255, 217, 134);
const Color themeLightPink = Color.fromARGB(255, 255, 242, 236);
const themeLightGrey = Color.fromARGB(255, 214, 214, 214);
const themeExtraLightGrey = Color.fromARGB(255, 238, 238, 238);
const themeUltraLightGrey = Color.fromARGB(255, 249, 249, 249);
const themeDarkGrey = Color.fromARGB(255, 66, 66, 66);

const double cardSizeFactor = 0.45;
const double spaceAroundAndBetweenCards = 5.0;

InputDecoration noBorderDecoration = const InputDecoration(
  border: InputBorder.none,
  focusedBorder: InputBorder.none,
  enabledBorder: InputBorder.none,
  errorBorder: InputBorder.none,
  disabledBorder: InputBorder.none,
);

InputDecoration textFieldDecoration = InputDecoration(
  labelText: 'Написать',
  floatingLabelBehavior: FloatingLabelBehavior.never,
  labelStyle: TextStyle(fontSize: 14),
);

//const String fontFamily = 'Montserrat';

const TextStyle primaryPageTitleStyle =
    TextStyle(fontSize: 20, fontWeight: FontWeight.w800);

const TextStyle secondaryPageTitleStyle =
    TextStyle(fontSize: 16, fontWeight: FontWeight.w700);

TextStyle buttonTextStyle({Color color = Colors.white}) =>
    TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: color);

TextStyle profileMenuItemStyle({bool isRed = false}) => TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: isRed ? Colors.red : Colors.grey[850]);

ButtonStyle signInPrimaryButtonStyle = ButtonStyle(
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0))),
  //padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 10.0)),
  backgroundColor: MaterialStateProperty.all(themeLightPink), //todo: change!
  //backgroundColor: MaterialStateProperty.all(Colors.transparent),
  elevation: MaterialStateProperty.all(0.0),
  //side: BorderSide(color: Colors.red)
);

ButtonStyle signInSecondaryButtonStyle = ButtonStyle(
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0))),
  overlayColor: null,
  //padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 10.0)),
  backgroundColor: MaterialStateProperty.all(Colors.transparent),
  elevation: MaterialStateProperty.all(0.0),
  //side: BorderSide(color: Colors.red)
);
