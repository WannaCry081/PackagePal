import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";


Text titleText(
  String text, {
    Color ?  titleColor,
    double ? titleSize, 
    FontWeight ? titleWeight,
    double ? titleLetterSpacing,
    double ? titleWordSpacing,
    double ? titleHeight,
    TextAlign ? titleAlignment,
    TextOverflow ? titleOverflow
    
  }) => Text(
    text,
    textAlign: titleAlignment,
    overflow: titleOverflow,
    softWrap: true,
    style: GoogleFonts.lato(
      color: titleColor,
      fontSize: titleSize,
      fontWeight: titleWeight,
      letterSpacing: titleLetterSpacing,
      wordSpacing: titleWordSpacing,
      height: titleHeight,
    )
  );


Text bodyText(
  String text,{
    Color ? bodyColor,
    double ? bodySize,
    FontWeight ? bodyWeight,
    double? bodyLetterSpacing,
    double? bodyWordSpacing,
    double? bodyHeight,
    TextAlign ? bodyAlignment,
    TextOverflow ? bodyOverflow
}) => Text(
  text,
  textAlign: bodyAlignment,
  overflow: bodyOverflow,
  style : GoogleFonts.poppins(
    color : bodyColor,
    fontSize : bodySize,
    fontWeight: bodyWeight,
    letterSpacing : bodyLetterSpacing,
    wordSpacing : bodyWordSpacing,
    height : bodyHeight,
  )
);


