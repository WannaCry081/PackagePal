import "package:flutter/material.dart";
import "package:flutter_feather_icons/flutter_feather_icons.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:frontend/core/constants/text_theme.dart";
import "package:frontend/core/providers/user_provider.dart";
import "package:frontend/core/utils/FormValidator.dart";
import "package:frontend/viewmodels/database_viewmodel.dart";
import "package:frontend/widgets/CustomButton.dart";
import "package:frontend/widgets/CustomDialogBox.dart";
import "package:frontend/widgets/CustomFormField.dart";
import "package:google_fonts/google_fonts.dart";
import "package:provider/provider.dart";

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  late TextEditingController _code;

  
  final db = DatabaseViewModel();
  final realtimeDb = RealtimeDatabaseViewModel();
  late String boxId = "";

  @override
  void initState() {
    super.initState();
    fetchBoxId();
    _code =  TextEditingController(text: "");
  }

  @override
  void dispose(){
    super.dispose();
    _code.dispose();
  }

   Future<void> fetchBoxId() async {
    String id = await db.getBoxId();
    setState(() {
      boxId = id;
    });
  }

  
  @override
  Widget build(BuildContext context) {
    final db = DatabaseViewModel();
    final userProvider = Provider.of<UserProvider>(context);
    final data = userProvider.getUserData();

    return Container(
      color: const Color.fromARGB(255, 13, 21, 23),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Spacer(),
                    // Container(
                    //   margin: const EdgeInsets.only(right: 8),
                    //   height: 40,
                    //   width: 40,
                    //   decoration: const BoxDecoration(
                    //     color: Colors.white,
                    //     shape: BoxShape.circle
                    //   ),
                    //   child: Icon(
                    //     FeatherIcons.moon,
                    //     color: Theme.of(context).colorScheme.secondary,
                    //     size: 20.0,
                    //     weight: 5.0,
                    //   )
                    // ),

                    CircleAvatar(
                      backgroundImage: NetworkImage(data?['photoUrl'] ?? ""),
                      radius: 20,
                    ),
                  ]
                ),
              ),
          
              const SizedBox(height: 10.0),
          
              Center(
                child: SvgPicture.asset(
                  "assets/svg/DeliveryGirl.svg",
                  height: MediaQuery.of(context).size.height * 0.40,
                ),
              ),
          
              Container(
                height: MediaQuery.of(context).size.height * 0.65,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 20),
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
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 246, 236, 226),
                        borderRadius: BorderRadius.circular(10.0)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            titleText(
                              "Start adding orders now!",
                              titleSize: 24.0,
                              titleWeight: FontWeight.bold,
                            ),
                            const SizedBox(height: 5),
                             bodyText(
                              "Receive packages effortlessly and hassle-free!",
                            ),
                           
                            const SizedBox(height: 20),
                            Form(
                              key: _form,
                              child: Column(
                                children: [
                                  CustomButton(
                                    btnColor: Theme.of(context).colorScheme.primary,
                                    btnOnTap: () async {
                                      bool currentStatus = await realtimeDb.getDoorStatus(boxId);

                                      await realtimeDb.updateDoorStatus(!currentStatus);
        
                                    },
                                        btnChild: Text("Open Container",
                                            style: GoogleFonts.lato(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: Theme.of(context).colorScheme.background)),
                                  ),
                                  const SizedBox(height: 10),
                                  CustomButton(
                                    btnColor: Theme.of(context).colorScheme.primary,
                                    btnOnTap: () {
                                      showDialog( context: context, 
                                      builder: (context){
                                        return CustomDialogBox(
                                            dialogTitle: "Connect to my Container",
                                            dialogSubtitle: "Enter the ID generated by the QR code.", 
                                            dialogContent: CustomFormField(
                                              formData: _code,
                                              formLabelText: "Unique Code",
                                              formValidator: (value) => FormValidator().validateInput(value, "Code", 2, 30),
                                              horizontalPadding: 0,
                                            ),
                                            dialogOption1: "Cancel", 
                                            dialogOption2: "Connect",
                                            dialogOption1OnTap: () => Navigator.of(context).pop(),
                                            dialogOption2OnTap: () async {
                                             if(_form.currentState!.validate()){
                                              db.addUniqueCode(_code.text.trim());
                                              Navigator.of(context).pop();
                                             } 
                                            });
                                          });
                                      },
                                    btnChild: Text("Connect to my Container",
                                        style: GoogleFonts.lato(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Theme.of(context).colorScheme.background)),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ),
                    // CustomButton(
                    //   btnColor: Theme.of(context).colorScheme.primary,
                    //   btnOnTap: () {
                    //     showDialog( context: context, 
                    //     builder: (context){
                    //       return CustomDialogBox(
                    //           dialogTitle: "Connect to my Container",
                    //           dialogSubtitle: "Enter the ID generated by the QR code.", 
                    //           dialogContent: CustomFormField(
                    //             formData: _code,
                    //             formLabelText: "Unique Code",
                    //             formValidator: (value) => FormValidator().validateInput(value, "Code", 2, 30),
                    //             horizontalPadding: 0,
                    //           ),
                    //           dialogOption1: "Cancel", 
                    //           dialogOption2: "Connect",
                    //           dialogOption1OnTap: () => Navigator.of(context).pop(),
                    //           dialogOption2OnTap: (){},);
                    //         });
                    //     },
                    //   btnChild: Text("Connect to my Container",
                    //       style: GoogleFonts.lato(
                    //           fontSize: 16,
                    //           fontWeight: FontWeight.w600,
                    //           color: Theme.of(context).colorScheme.background)),
                    // )
                  ] 
                )
              )
            ],
          ),
        ),
      )
    );
  }
}