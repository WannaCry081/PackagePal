import "package:flutter/material.dart";
import "package:frontend/views/Login/index.dart";
import "package:frontend/widgets/CustomButton.dart";
import "package:google_fonts/google_fonts.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:frontend/viewmodels/auth_viewmodel.dart";

class OnboardingView extends StatefulWidget {
  static String id = "/onboarding";

  const OnboardingView({Key? key}) : super(key: key);

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  int _currentIndex = 0;
  final _informations = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: PageView.builder(
            onPageChanged: _onPageChanged,
            allowImplicitScrolling: true,
            itemCount: _informations.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Expanded(
                    child: Image(
                        image: AssetImage(_informations[index]["image"]!),
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover),
                  ),
                  SizedBox(
                      height: 140,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 15),
                            Text(_informations[index]["title"].toString(),
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                    fontSize: 22, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 10),
                            Text(
                              _informations[index]["body"].toString(),
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
            height: 160,
            width: MediaQuery.of(context).size.width,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: SizedBox(
                      height: 20,
                      width: 50,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 2),
                              child: Container(
                                width: 12,
                                height: 12,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: (index == _currentIndex)
                                      ? Theme.of(context).colorScheme.primary
                                      : Colors.grey.shade200,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: CustomButton(
                        btnColor: Colors.grey.shade100,
                        btnShadow: true,
                        btnOnTap: () => AuthViewModel().signInWithGoogle(),
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
                  GestureDetector(
                      onTap: () =>
                          Navigator.of(context).pushNamed(LoginView.id),
                      child: Text("Continue with Email Instead",
                          style: GoogleFonts.lato(
                              fontSize: 14,
                              color: Theme.of(context).colorScheme.secondary,
                              fontWeight: FontWeight.bold))),
                  const SizedBox(height: 20)
                ])),
      ],
    ));
  }

  void _onPageChanged(int value) {
    setState(() {
      _currentIndex = value;
    });
  }
}
