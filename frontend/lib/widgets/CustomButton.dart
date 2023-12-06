import "package:flutter/material.dart";

class CustomButton extends StatelessWidget {
  final Widget btnChild;
  final void Function() btnOnTap;
  final bool btnShadow;
  final Color btnColor;
  const CustomButton(
      {Key? key,
      required this.btnChild,
      required this.btnOnTap,
      this.btnShadow = false,
      this.btnColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: btnOnTap,
        child: Container(
            height: 55,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: (btnShadow)
                    ? [
                        BoxShadow(
                          color: Colors.black
                              .withOpacity(0.2), // Adjust the opacity as needed
                          spreadRadius: 0,
                          blurRadius: 4,
                          offset:
                              const Offset(0, 2), // changes position of shadow
                        ),
                      ]
                    : null,
                color: btnColor,
                border: Border.all(color: Colors.grey.shade200)),
            child: Center(child: btnChild)));
  }
}
