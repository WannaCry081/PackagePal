import "package:flutter/material.dart";
import "package:flutter_feather_icons/flutter_feather_icons.dart";
import "package:frontend/widgets/CustomFormField.dart";
import "package:google_fonts/google_fonts.dart";
import "package:frontend/widgets/CustomButton.dart";

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => RegisterViewState();
}

class RegisterViewState extends State<RegisterView> {
  final GlobalKey<FormState> form = GlobalKey<FormState>();
  late TextEditingController _userName;
  late TextEditingController _email;
  late TextEditingController _confirmPassword;
  late TextEditingController _password;

  @override
  void initState() {
    super.initState();
    _userName = TextEditingController(text: "");
    _email = TextEditingController(text: "");
    _confirmPassword = TextEditingController(text: "");
    _password = TextEditingController(text: "");
  }

  @override
  void dispose() {
    super.dispose();
    _userName.dispose();
    _email.dispose();
    _confirmPassword.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, bottom: 30, top: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade200),
                          borderRadius: BorderRadius.circular(14)),
                      child: const Center(
                          child: Icon(FeatherIcons.chevronLeft, size: 34))),
                ),
              ],
            )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text("Hey, Pal! 👋🏻\nGet started with us!",
              style:
                  GoogleFonts.lato(fontSize: 30, fontWeight: FontWeight.w900)),
        ),
        const SizedBox(height: 20),
        Form(
            key: form,
            child: Column(
              children: [
                const SizedBox(height: 20),
                CustomFormField(
                  formData: _userName,
                  formLabelText: "Username",
                ),
                const SizedBox(height: 20),
                CustomFormField(
                  formData: _email,
                  formLabelText: "Email Address",
                ),
                const SizedBox(height: 20),
                CustomFormField(
                    formData: _password,
                    formLabelText: "Password",
                    formObsecure: true),
                const SizedBox(height: 20),
                CustomFormField(
                    formData: _confirmPassword,
                    formLabelText: "Confirm Password",
                    formObsecure: true),
                const SizedBox(height: 20),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: CustomButton(
                      btnColor: Theme.of(context).colorScheme.primary,
                      btnOnTap: () {},
                      btnChild: Text("Submit",
                          style: GoogleFonts.lato(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).colorScheme.background)),
                    )),
                const SizedBox(height: 20),
                SizedBox(height: MediaQuery.of(context).size.height - 700),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account? ",
                        style: GoogleFonts.lato(fontSize: 14)),
                    GestureDetector(
                        onTap: () => Navigator.of(context)
                            .pushReplacementNamed("/auth/login"),
                        child: Text("Sign in",
                            style: GoogleFonts.lato(
                                fontSize: 14,
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.bold)))
                  ],
                ),
              ],
            ))
      ],
    )));
  }
}
