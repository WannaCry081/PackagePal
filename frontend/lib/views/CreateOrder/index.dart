import "package:flutter/material.dart";
import "package:flutter_feather_icons/flutter_feather_icons.dart";
import "package:frontend/core/constants/text_theme.dart";

class CreateOrderView extends StatelessWidget {
  const CreateOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: IconButton(
                      icon: const Icon(FeatherIcons.arrowLeft),
                       onPressed: () => Navigator.of(context).pop()
                    ),
                  ),
                  titleText(
                    "Create Order",
                    titleSize: 20.0,
                    titleWeight: FontWeight.bold,
                    titleColor: Colors.grey[700]
                  )
                ],
              ),
              const SizedBox(height: 10.0),
              
            ],
          )
        ),
      )
    );
  }
}