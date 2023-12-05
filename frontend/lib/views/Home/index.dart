import "package:flutter/material.dart";
import "package:flutter_feather_icons/flutter_feather_icons.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:frontend/core/constants/text_theme.dart";
import "package:google_fonts/google_fonts.dart";

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 13, 21, 23),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 14.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                      Container(
                        height: 30,
                        width: 30,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white
                        ),
                        child: Icon(
                          FeatherIcons.mapPin,
                          color: Theme.of(context).colorScheme.secondary,
                          size: 15.0,
                        )
                      ),
                      const SizedBox(width: 10.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          bodyText(
                            "Your location",
                            bodyColor: Colors.grey[500],
                            bodySize: 10.0
                          ),
                          bodyText(
                            "Cebu City, Cebu",
                            bodyColor: Colors.white,
                            bodySize: 12.0
                          ),
                        ],
                      )
                    ],),
                    const Spacer(),
                    Container(
                      height: 30,
                      width: 30,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle
                      ),
                      child: Icon(
                        FeatherIcons.moon,
                        color: Theme.of(context).colorScheme.secondary,
                        size: 15.0
                      )
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 8),
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        shape: BoxShape.circle
                      ),
                    ),
                  ]
                ),
              ),
          
              const SizedBox(height: 15.0),
          
              Center(
                child: SvgPicture.asset(
                  "assets/svg/DeliveryGirl.svg",
                  height: MediaQuery.of(context).size.height * 0.28,
                ),
              ),
          
              Container(
                height: MediaQuery.of(context).size.height * 0.50,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  )
                ),
                child: Column(
                  children: [
                    Container(
                        margin: const EdgeInsets.only(top: 10.0, bottom: 15.0),
                        width: MediaQuery.of(context).size.width * 0.08,
                        height: 4.0,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(25.0)
                        ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 165,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 246, 236, 226),
                        borderRadius: BorderRadius.circular(10.0)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            titleText(
                              "Check Your Package",
                              titleSize: 20.0,
                              titleWeight: FontWeight.bold,
                            ),
                            const SizedBox(height: 4),
                            bodyText(
                              "Enter the name of the package you want to view",
                              bodySize: 12.0,
                              bodyColor: Colors.grey[800],
                              bodyAlignment: TextAlign.center,
                            ),
                            const SizedBox(height: 6),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10.0),
                              child: TextField(
                                style: GoogleFonts.poppins(fontSize : 12.0),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                    borderSide: BorderSide.none
                                  ),
                                    hintStyle: GoogleFonts.poppins(
                                      fontSize : 12.0,
                                    ),
                                    hintText: 'Enter the package name',
                                    filled: true,
                                    fillColor: Colors.white,
                                    suffixIcon: Container(
                                      margin: const EdgeInsets.all(6.0),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Theme.of(context).colorScheme.secondary
                                      ),
                                      child: const Icon(
                                        FeatherIcons.search,
                                        color: Colors.white,
                                        size: 18.0
                                      ),
                                    )
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ),
                    const SizedBox(height: 10.0),
                    PackageCard(context),
                  ]
                )
              )
            ],
          ),
        ),
      )
    );
  }


  Widget PackageCard (context,) => Container(
    height: 65,
    width: MediaQuery.of(context).size.width,
    padding: EdgeInsets.all(8),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
      border: Border.all(color: Colors.grey.shade400)
    ),
    child: Row(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 8),
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            shape: BoxShape.circle
          ),
        ),
        const SizedBox(width: 8.0),
        Container(
           constraints: const BoxConstraints(
            maxWidth: 95.0, // Adjust the maxWidth as needed
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              titleText(
                "Arduino Uno Kit",
                titleSize: 14.0,
                titleWeight: FontWeight.bold,
                titleOverflow: TextOverflow.ellipsis
              ),
              bodyText(
                "#djc20c8n3",
                bodySize: 10.0,
                bodyColor: Colors.grey[800],
                bodyOverflow: TextOverflow.ellipsis
              )
            ],
          ),
        ),
        const Spacer(),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(7.0)
          ),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: bodyText(
              "On Process",
              bodySize: 10,
              bodyColor: Colors.white
            ),
          ),
        )
      ]
    )
  );
}