import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:google_fonts/google_fonts.dart";
import "package:flutter_feather_icons/flutter_feather_icons.dart";
import "package:frontend/widgets/CustomButton.dart";
import "package:frontend/widgets/CustomFormField.dart";
import "package:frontend/viewmodels/auth_viewmodel.dart";
import "package:frontend/core/utils/FormValidator.dart";

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  late TextEditingController _email;
  late TextEditingController _password;
  int _gap = 715;

  @override
  void initState() {
    super.initState();
    _email = TextEditingController(text: "");
    _password = TextEditingController(text: "");
  }

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
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
          child: Text("Welcome back!\nGlad to see you again!",
              style:
                  GoogleFonts.lato(fontSize: 30, fontWeight: FontWeight.w900)),
        ),
        const SizedBox(height: 20),
        Form(
            key: _form,
            child: Column(
              children: [
                const SizedBox(height: 20),
                CustomFormField(
                  formData: _email,
                  formLabelText: "Email Address",
                  formValidator: FormValidator().validateEmail,
                ),
                const SizedBox(height: 20),
                CustomFormField(
                  formData: _password,
                  formLabelText: "Password",
                  formObsecure: true,
                  formValidator: FormValidator().validatePassword,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () => Navigator.of(context)
                            .pushNamed("/auth/forgot-password"),
                        child: Text("Forgot Password?",
                            style: GoogleFonts.lato(
                                fontSize: 14,
                                color: Theme.of(context).colorScheme.secondary,
                                fontWeight: FontWeight.bold)),
                      ),
                    )),
                const SizedBox(height: 20),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: CustomButton(
                      btnColor: Theme.of(context).colorScheme.primary,
                      btnOnTap: () {
                        if (_form.currentState!.validate()) {
                          setState(() => _gap = 715);
                        } else {
                          setState(() => _gap = 760);
                        }
                      },
                      btnChild: Text("Login",
                          style: GoogleFonts.lato(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).colorScheme.background)),
                    )),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Flexible(
                          child: Container(
                              color: Colors.grey.shade200, height: 2)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text("or",
                            style: GoogleFonts.poppins(fontSize: 14)),
                      ),
                      Flexible(
                          child:
                              Container(color: Colors.grey.shade200, height: 2))
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: CustomButton(
                      btnShadow: false,
                      btnColor: Colors.grey.shade100,
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
                SizedBox(height: MediaQuery.of(context).size.height - _gap),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account? ",
                        style: GoogleFonts.lato(fontSize: 14)),
                    GestureDetector(
                        onTap: () => Navigator.of(context)
                            .pushReplacementNamed("/auth/register"),
                        child: Text("Sign up",
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
