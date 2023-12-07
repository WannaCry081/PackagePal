import "package:flutter/material.dart";
import "package:flutter_feather_icons/flutter_feather_icons.dart";
import "package:frontend/core/constants/text_theme.dart";
import "package:frontend/widgets/CustomButton.dart";
import "package:frontend/widgets/CustomFormField.dart";
import "package:google_fonts/google_fonts.dart";

class EditDeliveryInfo extends StatefulWidget {
  const EditDeliveryInfo({super.key});

  @override
  State<EditDeliveryInfo> createState() => _EditDeliveryInfoState();
}

class _EditDeliveryInfoState extends State<EditDeliveryInfo> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  late TextEditingController _contactNumber;
  late TextEditingController _address;

  @override
  void initState(){
    super.initState();
    _contactNumber = TextEditingController(text: "");
    _address = TextEditingController(text: "");
  }

  @override
  void dispose(){
    super.dispose();
    _contactNumber.dispose();
    _address.dispose();
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
                    "Change Delivery Information",
                    bodySize: 18.0,
                    bodyWeight: FontWeight.w500,
                    bodyColor: Colors.grey[800]
                  )
                ],),
              ),

              Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary.withAlpha(10),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Theme.of(context).colorScheme.primary.withAlpha(50))
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 55,
                              width: 55,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Theme.of(context).colorScheme.secondary.withAlpha(40)
                              ),
                              child: Icon(FeatherIcons.map, 
                                color: Theme.of(context).colorScheme.secondary),
                            ),
                      
                            const SizedBox(width: 15),
                      
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  titleText("Shiela Mae Lepon",
                                      titleWeight: FontWeight.bold,
                                      titleColor: Theme.of(context).colorScheme.primary,
                                      titleSize: 20),
                                  const SizedBox(height: 2),
                                  bodyText("09254747461",
                                      bodyWeight: FontWeight.w400,
                                      bodyColor: Colors.grey[700],
                                      bodySize: 14),
                                  const SizedBox(height: 2),
                                  bodyText("Bulacao Pardo, Cebu City, Bulacao, Bulacao",
                                      bodyWeight: FontWeight.w400,
                                      bodyColor: Colors.grey[700],
                                      bodySize: 14),
                                  const SizedBox(height: 2),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: titleText("Edit Information",
                          titleWeight: FontWeight.bold,
                          titleColor: Theme.of(context).colorScheme.secondary,
                          titleSize: 20),
                    ),
                    
                    const SizedBox(height: 10),
                    
                    CustomFormField(
                      formData: _contactNumber,
                      formLabelText: "Contact Number" ),
                    
                    const SizedBox(height: 20),
              
                    CustomFormField(
                      formData: _address,
                      formLabelText: "Address" ),
                    
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
              )
          ],
        ),
      ),
    );
  }
}