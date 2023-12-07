import "package:flutter/material.dart";
import "package:flutter_feather_icons/flutter_feather_icons.dart";
import "package:frontend/core/constants/text_theme.dart";
import "package:frontend/widgets/CustomButton.dart";
import "package:frontend/widgets/CustomFormField.dart";
import "package:google_fonts/google_fonts.dart";

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  late TextEditingController _oldPassword;
  late TextEditingController _newPassword;
  late TextEditingController _confirmPassword;

   @override
  void initState(){
    super.initState();
    _oldPassword = TextEditingController(text: "");
    _newPassword = TextEditingController(text: "");
    _confirmPassword = TextEditingController(text: "");
  }

  @override
  void dispose(){
    super.dispose();
    _oldPassword.dispose();
    _newPassword.dispose();
    _confirmPassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
             Padding(
                padding: const EdgeInsets.fromLTRB(20, 25, 20, 10),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Icon(FeatherIcons.arrowLeft, color: Colors.grey[800])),
                    const SizedBox(width: 10),
                    bodyText(
                      "Change Password",
                      bodySize: 18.0,
                      bodyWeight: FontWeight.w500,
                      bodyColor: Colors.grey[800]
                    )
                  ],),
                ),

              Form(
                key: _formkey,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Column(
                    children: [
                      CustomFormField(
                          formData: _oldPassword,
                          formObsecure: true,
                          formLabelText: "Current Password" ),
                        
                      const SizedBox(height: 20),
                      CustomFormField(
                        formData: _newPassword,
                        formObsecure: true,
                        formLabelText: "New Password" ),
                      
                      const SizedBox(height: 20),
                      CustomFormField(
                        formData: _confirmPassword,
                        formObsecure: true,
                        formLabelText: "Confirm New Password" ),
                      
                      const SizedBox(height: 20),
                  
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: CustomButton(
                            btnColor: Theme.of(context).colorScheme.primary,
                            btnOnTap: () {},
                            btnChild: Text("Save Changes",
                                style: GoogleFonts.lato(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Theme.of(context).colorScheme.background)),
                        )),
                    ],
                  ),
                ),
              )
              
          ],
        ),
      )
    );
  }
}