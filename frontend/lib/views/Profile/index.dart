import "package:flutter/material.dart";
import "package:frontend/core/constants/text_theme.dart";

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/Profile_MeshGradient.png"),
          fit: BoxFit.cover
        )
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 20.0),
              Row(
                children: [
                  titleText(
                    "User Profile",
                    titleSize: 20.0,
                    titleColor: Colors.grey[800]
                  ),
                ],
              ),
              const SizedBox(height: 25.0),
              // Container( 
              //   height: 140,
              //   width: 140,
              //   decoration: BoxDecoration(
              //     shape: BoxShape.circle,
              //     color: Theme.of(context).colorScheme.primary,
              //   ),
              // ),

              const CircleAvatar(
                backgroundImage: AssetImage("assets/images/Bubbles.jpg"),
                radius: 70,
              ),
              const SizedBox(height: 20.0),
              titleText(
                "Shiela Mae Lepon",
                titleSize: 26.0,
                titleWeight: FontWeight.bold,
              ),
              const SizedBox(height: 30.0),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 16.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                     BoxShadow(
                      offset: const Offset(0, 15),
                      spreadRadius: 0,
                      blurRadius: 30,
                      color: Colors.black.withOpacity(0.10),
                    )
                  ]
                ),
                child: Column(
                  children: [
                    profileItem("Email", "shiela.mlepon@gmail.com"),
                    profileItem("Phone Number", "09254747461"),
                    profileItem("Address", "Bulacao Pardo, Cebu City, Cebu, 6000"),
                  ]
                )
              )
            ]
          ),
        )
      )
    );
  }

  Widget profileItem (label, data) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 10.0),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            titleText(
              label,
              titleSize: 16.0,
              titleColor: Colors.grey
            ),
            Container(
              constraints: const BoxConstraints(maxWidth: 225.0),
              child: bodyText(
                data,
                bodySize: 16.0,
              ),
            )
          ],
        ),
        Divider(color: Colors.grey[200])
      ],
    ),
  );
}