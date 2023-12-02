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
                    ? const [
                        BoxShadow(
                            blurRadius: 4, color: Color.fromARGB(100, 0, 0, 0)),
                      ]
                    : null,
                color: btnColor,
                border: Border.all(color: Colors.grey.shade100)),
            child: Center(child: btnChild)));
  }
}
