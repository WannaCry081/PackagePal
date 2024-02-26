import "package:flutter/material.dart";
import "package:frontend/core/constants/text_theme.dart";

class CustomDialogBox extends StatelessWidget {
  final String dialogTitle;
  final String ? dialogSubtitle;
  final Widget ? dialogContent;
  final String dialogOption1;
  final String dialogOption2;

  final void Function() ? dialogOption1OnTap;
  final void Function() ? dialogOption2OnTap;

  const CustomDialogBox({
    Key? key,
    required this.dialogTitle,
    required this.dialogContent,
    required this.dialogOption1,
    required this.dialogOption2,

    this.dialogSubtitle,
    this.dialogOption1OnTap,
    this.dialogOption2OnTap,
  }) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          titleText(
            dialogTitle, 
            titleWeight: FontWeight.bold,
            titleSize: 20.0,
            titleColor: Theme.of(context).colorScheme.primary
          ),
          const SizedBox(height: 5),
          bodyText(
            dialogSubtitle!,
            bodySize: 14.0,
            bodyColor: Colors.grey[600]
          )
        ],
      ),
      content: dialogContent,
      actions :[
        GestureDetector(
          onTap : dialogOption1OnTap,
          child: bodyText(
            dialogOption1,
            bodyWeight : FontWeight.w500,
            bodySize : 16,
            bodyColor: Colors.grey[600]
          ),
        ),
        const SizedBox(width: 5),
        GestureDetector(
          onTap : dialogOption2OnTap,
          child: bodyText(
            dialogOption2,
            bodyWeight : FontWeight.w500,
            bodySize : 16,
            bodyColor: Theme.of(context).colorScheme.primary
          ),
        ),
      ]
    );
  }
}