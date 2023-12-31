import "package:flutter/material.dart";
import "package:flutter_feather_icons/flutter_feather_icons.dart";
import "package:frontend/core/utils/FormValidator.dart";
import "package:frontend/widgets/CustomFormField.dart";
import "package:google_fonts/google_fonts.dart";
import "package:frontend/widgets/CustomButton.dart";

class ForgotPasswordView extends StatefulWidget {
  static String id = "/forgot-password";

  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  late TextEditingController _email;
  int _gap = 470;

  @override
  void initState() {
    super.initState();
    _email = TextEditingController(text: "");
  }

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Forgot Password?",
                  style: GoogleFonts.lato(
                      fontSize: 30, fontWeight: FontWeight.w900)),
              const SizedBox(height: 10),
              Text(
                  "Don't worry! It occurs. Please enter the\nEmail address linked with your account.",
                  style: GoogleFonts.poppins(
                      fontSize: 16, color: Colors.grey.shade800))
            ],
          ),
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
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: CustomButton(
                      btnColor: Theme.of(context).colorScheme.primary,
                      btnOnTap: () {
                        if (_form.currentState!.validate()) {
                          setState(() {
                            _gap = 475;
                          });
                        } else {
                          setState(() {
                            _gap = 495;
                          });
                        }
                      },
                      btnChild: Text("Submit",
                          style: GoogleFonts.lato(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).colorScheme.background)),
                    )),
              ],
            )),
        SizedBox(height: MediaQuery.of(context).size.height - _gap),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Remembered your Password? ",
                style: GoogleFonts.lato(fontSize: 14)),
            GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Text("Sign in",
                    style: GoogleFonts.lato(
                        fontSize: 14,
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold)))
          ],
        ),
      ],
    )));
  }
}
