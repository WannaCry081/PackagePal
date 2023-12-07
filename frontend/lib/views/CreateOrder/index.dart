import "package:flutter/material.dart";
import "package:flutter_feather_icons/flutter_feather_icons.dart";
import "package:frontend/core/constants/text_theme.dart";
import "package:frontend/widgets/CustomButton.dart";
import "package:frontend/widgets/CustomFormField.dart";
import "package:google_fonts/google_fonts.dart";

class CreateOrderView extends StatefulWidget {
  const CreateOrderView({super.key});

  @override
  State<CreateOrderView> createState() => _CreateOrderViewState();
}

class _CreateOrderViewState extends State<CreateOrderView> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  late TextEditingController _packageName;
  late TextEditingController _pin;
  late TextEditingController _weight;
  late TextEditingController _price;
  late TextEditingController _driverName;
  late TextEditingController _driverNumber;

  @override
  void initState() {
    super.initState();
    _packageName = TextEditingController(text: "");
    _pin = TextEditingController(text: "");
    _weight = TextEditingController(text: "");
    _price = TextEditingController(text: "");
    _driverName = TextEditingController(text: "");
    _driverNumber = TextEditingController(text: "");
  }

  @override
  void dispose(){
    super.dispose();
    _packageName.dispose();
    _pin.dispose();
    _weight.dispose();
    _price.dispose();
    _driverName.dispose();
    _driverNumber.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _form,
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
                    titleText(
                      "Create Order",
                      titleSize: 24.0,
                      titleWeight: FontWeight.bold,
                      titleColor: Colors.grey[800]
                    )
                  ],),
                ),
            
                // Package Details
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary.withAlpha(10),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Theme.of(context).colorScheme.primary.withAlpha(50))
                    ),
                    child: (
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                             padding: const EdgeInsets.symmetric(horizontal:20.0),
                             child: titleText(
                              "Package Details",
                              titleSize: 20.0,
                              titleColor: Theme.of(context).colorScheme.secondary,
                              titleWeight: FontWeight.bold)),
            
                          const SizedBox(height: 20),
            
                          CustomFormField(
                            formData: _packageName,
                            formLabelText: "Name" ),
                          
                          const SizedBox(height: 10),
            
                          Row(
                            children: [
                              Expanded(
                                child: CustomFormField(
                                  formData: _price,
                                  formLabelText: "Price"),
                              ),
                              Container(
                                margin: const EdgeInsets.only(right: 20),
                                height: 55,
                                width: 55,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.primary,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: bodyText(
                                    "PHP",
                                    bodySize: 14,
                                    bodyColor: Colors.white,
                                    bodyWeight: FontWeight.w600
                                  ),
                                )
                              )
                            ],
                          ),
            
                          const SizedBox(height: 10),
            
                          Row(
                            children: [
                              Expanded(
                                child: CustomFormField(
                                  formData: _weight,
                                  formLabelText: "Weight",
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(right: 20),
                                height: 55,
                                width: 55,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.primary,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: bodyText(
                                    "KG",
                                    bodySize: 14,
                                    bodyColor: Colors.white,
                                    bodyWeight: FontWeight.w600
                                  ),
                                )
                              )
                            ],
                          ),
                        ],
                      )
                    )
                  ),
                ),
            
                //Setup PIN Code
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary.withAlpha(10),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Theme.of(context).colorScheme.primary.withAlpha(50))
                    ),
                    child: (
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                             padding: const EdgeInsets.symmetric(horizontal:20.0),
                             child: titleText(
                              "Setup 10-PIN Code",
                              titleSize: 20.0,
                              titleColor: Theme.of(context).colorScheme.secondary,
                              titleWeight: FontWeight.bold)),
            
                          const SizedBox(height: 20),
            
                          Row(
                            children: [
                              Expanded(
                                child: CustomFormField(
                                  formData: _pin,
                                  formLabelText: "PIN Code"),
                              ),
                              Container(
                                margin: const EdgeInsets.only(right: 20),
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                height: 55,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.primary,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: bodyText(
                                    "Auto Generate",
                                    bodySize: 14.0,
                                    bodyColor: Colors.white,
                                    bodyWeight: FontWeight.w600
                                  ),
                                )
                              )
                            ],
                          ),
                        ],
                      )
                    )
                  ),
                ),
            
                //Driver Details 
                Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary.withAlpha(10),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Theme.of(context).colorScheme.primary.withAlpha(50))
                    ),
                    child: (
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                             padding: const EdgeInsets.symmetric(horizontal:20.0),
                             child: titleText(
                              "Driver Details",
                              titleSize: 20.0,
                              titleColor: Theme.of(context).colorScheme.secondary,
                              titleWeight: FontWeight.bold)),
            
                          const SizedBox(height: 20),
            
                          CustomFormField(
                            formData: _driverName,
                            formLabelText: "Name" ),
                          
                          const SizedBox(height: 10),
            
                          CustomFormField(
                            formData: _driverNumber,
                            formLabelText: "Contact Number" ),                  
                        ],
                      )
                    )
                  ),
                ),

                const SizedBox(height: 10),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CustomButton(
                    btnColor: Theme.of(context).colorScheme.primary,
                    btnOnTap: () {},
                    btnChild: Text("Submit Order",
                        style: GoogleFonts.lato(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.background)),
                )),

                const SizedBox(height: 30),
                
              ],
            ),
          )
        ),
      )
    );
  }
}