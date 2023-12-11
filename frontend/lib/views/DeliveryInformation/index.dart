import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";
import "package:flutter_feather_icons/flutter_feather_icons.dart";
import "package:frontend/core/constants/text_theme.dart";
import "package:frontend/core/providers/user_provider.dart";
import "package:frontend/core/utils/FormValidator.dart";
import "package:frontend/models/user_model.dart";
import "package:frontend/viewmodels/auth_viewmodel.dart";
import "package:frontend/viewmodels/database_viewmodel.dart";
import "package:frontend/widgets/CustomButton.dart";
import "package:frontend/widgets/CustomFormField.dart";
import "package:google_fonts/google_fonts.dart";
import "package:provider/provider.dart";

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
    final db = DatabaseViewModel();

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
                                    } else {
                                      Map<String, dynamic> userData = snapshot.data!.data() ?? {};

                                      return Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        titleText(
                                            userData['displayName'] ?? '',
                                            titleWeight: FontWeight.bold,
                                            titleColor: Theme.of(context).colorScheme.primary,
                                            titleSize: 20),
                                        const SizedBox(height: 2),
                                        bodyText(
                                            userData['contactNumber'] ?? "Contact Number",
                                            bodyWeight: FontWeight.w400,
                                            bodyColor: Colors.grey[700],
                                            bodySize: 14),
                                        const SizedBox(height: 2),
                                        bodyText(
                                            userData['address'] ?? "Address",
                                            bodyWeight: FontWeight.w400,
                                            bodyColor: Colors.grey[700],
                                            bodySize: 14),
                                        const SizedBox(height: 2),
                                      ],
                                    );
                                    }
                                    
                                  }
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
                        formValidator: (value) => FormValidator().validateDigits(value, "Contact number", 11),
                        formLabelText: "Contact Number" ),
                      
                      const SizedBox(height: 20),
                
                      CustomFormField(
                        formData: _address,
                        formValidator: (value) => FormValidator().validateInput(value, "Address", 2, 50),
                        formLabelText: "Address" ),
                      
                      const SizedBox(height: 20),
                
                       Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: CustomButton(
                          btnColor: Theme.of(context).colorScheme.primary,
                          btnOnTap: () async {
                            if(_formkey.currentState!.validate()){
                              await db.updateUserCredential(
                              UserModel(
                                uid: AuthViewModel().getUserUID,
                                  email: AuthViewModel().getUserEmail,
                                  displayName: AuthViewModel().getUserDisplayName,
                                  photoUrl: AuthViewModel().getUserPhotoUrl,
                                  address: _address.text.trim(),
                                  contactNumber: _contactNumber.text.trim()
                                ).toMap());

                                await Future.delayed(const Duration(seconds: 1));
                                Navigator.of(context).pop();
                            }
                          },
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
      ),
    );
  }
}