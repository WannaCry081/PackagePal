import "package:flutter/material.dart";
import "package:frontend/widgets/CustomButton.dart";
import "package:google_fonts/google_fonts.dart";
import "package:flutter_svg/flutter_svg.dart";

class OnboardingView extends StatelessWidget {
  final informations = [
    {
      "image": "assets/images/Onboarding_1.jpg",
      "title": "Streamlined Package Reception",
      "body":
          "Effortlessly manage your packages with our\napp, designed for convenience and to give\nyou more time for what's important."
    },
    {
      "image": "assets/images/Onboarding_3.jpg",
      "title": "Unmatched Convenience",
      "body":
          "Receive packages effortlessly and hassle-free\nwith our user-friendly app, ensuring a\nseamless delivery experience."
    },
    {
      "image": "assets/images/Onboarding_2.jpg",
      "title": "Fortified Security Measures",
      "body":
          "Experience secure package retrieval with our app's\nadvanced security features, ensuring your deliveries'\nsafety and your peace of mind."
    },
  ];

  OnboardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: PageView.builder(
            allowImplicitScrolling: true,
            itemCount: informations.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Expanded(
                    child: Image(
                        image: AssetImage(informations[index]["image"]!),
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover),
                  ),
                  SizedBox(
                      height: 140,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 20),
                            Text(informations[index]["title"].toString(),
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                    fontSize: 22, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 10),
                            Text(
                              informations[index]["body"].toString(),
                              textAlign: TextAlign.center,
                              style: GoogleFonts.lato(
                                  fontSize: 16, color: Colors.grey.shade800),
                            )
                          ]))
                ],
              );
            },
          ),
        ),
        SizedBox(
            height: 140,
            width: MediaQuery.of(context).size.width,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: CustomButton(
                        btnColor: Colors.grey.shade100,
                        btnShadow: true,
                        btnOnTap: () {},
                        btnChild: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset("assets/svg/GoogleIcon.svg",
                                  width: 16, height: 16),
                              const SizedBox(width: 10),
                              Text(
                                "Continue with Google",
                                style: GoogleFonts.lato(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              )
                            ])),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account? ",
                          style: GoogleFonts.lato(fontSize: 14)),
                      GestureDetector(
                          onTap: () => navigateToLogin(context),
                          child: Text("Log in",
                              style: GoogleFonts.lato(
                                  fontSize: 14,
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.bold)))
                    ],
                  ),
                  const SizedBox(height: 20)
                ])),
      ],
    ));
  }

  void navigateToLogin(BuildContext context) {
    Navigator.of(context).pushNamed("/auth/login");
    return;
  }
}
