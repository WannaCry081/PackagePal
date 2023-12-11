import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";
import "package:flutter_feather_icons/flutter_feather_icons.dart";
import "package:frontend/core/constants/text_theme.dart";
import "package:frontend/viewmodels/auth_viewmodel.dart";
import "package:frontend/viewmodels/database_viewmodel.dart";
import "package:frontend/views/ChangePassword/index.dart";
import "package:frontend/views/DeliveryInformation/index.dart";
import 'package:frontend/views/Profile/index.dart';
import "package:frontend/widgets/CustomButton.dart";
import "package:google_fonts/google_fonts.dart";

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  

  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    final db = DatabaseViewModel();

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 242, 234, 227),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Center(
            child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
              stream: db.getUserCredential(),
              builder: (context, snapshot) {
                 if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: SizedBox(
                      height: 50, width: 50,
                      child: CircularProgressIndicator()),
                  ); 
                } else if (snapshot.hasError) {
                  return Center(child: titleText('Error loading data')); // Handle error
                } 
                else {
                  Map<String, dynamic> userData = snapshot.data!.data() ?? {};

                   return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 35.0),
                    CircleAvatar(
                      backgroundImage: NetworkImage(userData['photoUrl'] ?? ""),
                      radius: 60,
                    ),
                    const SizedBox(height: 20.0),
                    titleText(
                      userData['displayName'] ?? "",
                      titleSize: 24.0,
                      titleWeight: FontWeight.bold
                    ),
                    const SizedBox(height: 5.0),
                    bodyText(
                      userData['email'] ?? "",
                      bodySize: 18.0,
                      bodyWeight: FontWeight.normal,
                      bodyColor: Colors.grey[800]
                    ),
                    const SizedBox(height: 20.0),
                    
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(20, 25, 20, 10),
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0),
                          )
                        ),
                        child: Column(
                          children: [
                            settingsItem(
                              FeatherIcons.user, "Change Display Name", EditProfileView(userData: userData,)),
                            settingsItem(
                              FeatherIcons.truck, "Change Delivery Information", const EditDeliveryInfo()),
                            settingsItem(
                              FeatherIcons.key, "Change Password", const ChangePasswordView()),
                                        
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10.0),
                              child: Row(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Theme.of(context).colorScheme.secondary.withAlpha(30)
                                    ),
                                    child: Icon(FeatherIcons.moon, color: Theme.of(context).colorScheme.secondary),
                                  ),
                                  const SizedBox(width: 15),
                                  titleText("Dark Mode",
                                    titleSize: 16.0
                                  ),
                                  const Spacer(),
                                  Transform.scale(
                                    scale: 1.2,
                                    child: Switch(
                                      value: isDark, 
                                      onChanged: (value){
                                        setState(() {
                                          isDark = value;
                                        });
                                    }),
                                  ),
                                ],
                              ),
                            ),
                                        
                            const Spacer(),
                                        
                            CustomButton(
                              btnColor: Theme.of(context).colorScheme.primary,
                              btnOnTap: () => AuthViewModel().signOutGoogle(),
                              btnChild: Text("Logout",
                                style: GoogleFonts.lato(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Theme.of(context).colorScheme.background)),
                            ),
                          ],
                        )
                      ),
                    )
                  ]
                );

                }
              }
            ),
          ),
        )
      ),
    );
  }

  Widget settingsItem (IconData icon, String title, Widget pageView) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 10.0),
    child: GestureDetector(
      onTap: () => {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => pageView)
        )
      },
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Theme.of(context).colorScheme.secondary.withAlpha(30)
            ),
            child: Icon(icon, color: Theme.of(context).colorScheme.secondary),
          ),
          const SizedBox(width: 15),
          titleText(
            title,
            titleSize: 16.0
          ),
          const Spacer(),
          Icon(FeatherIcons.chevronRight, color: Colors.grey[700]),
        ],
      ),
    ),
  );
}