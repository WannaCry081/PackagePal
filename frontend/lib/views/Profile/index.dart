import "package:flutter/material.dart";
import "package:flutter_feather_icons/flutter_feather_icons.dart";
import "package:frontend/core/constants/text_theme.dart";
import "package:frontend/widgets/CustomButton.dart";
import "package:frontend/widgets/CustomFormField.dart";
import "package:google_fonts/google_fonts.dart";

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _displayName;

  @override
  void initState(){
    super.initState();
    _displayName = TextEditingController(text: "");
  }

  @override 
  void dispose(){
    super.dispose();
    _displayName.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                        "Change Display Name",
                        bodySize: 18.0,
                        bodyWeight: FontWeight.w500,
                        bodyColor: Colors.grey[800]
                      )
                    ],),
                  ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        titleText("Current", titleColor: Colors.grey[600], titleSize: 14),
                        const SizedBox(height: 5),
                        Container(
                          height: 55,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary.withAlpha(20),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextFormField(
                            readOnly: true,
                            decoration: InputDecoration(
                                labelStyle: GoogleFonts.poppins(
                                  fontSize : 14,
                                  color: Colors.grey[600]
                                ),
                                // labelText: widget.formLabelText,
                                hintText: "hello world",
                                hintStyle: GoogleFonts.poppins(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.grey.shade200)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.grey.shade200)),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.red.shade300)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: Theme.of(context).colorScheme.primary))),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                CustomFormField(
                  formData: _displayName,
                  formLabelText: "New Display Name" ),
                
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
    );
  }
}