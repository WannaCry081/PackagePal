import "package:flutter/material.dart";
import "package:flutter_feather_icons/flutter_feather_icons.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:frontend/core/constants/text_theme.dart";
import "package:frontend/core/providers/user_provider.dart";
import "package:frontend/viewmodels/auth_viewmodel.dart";
import "package:frontend/viewmodels/database_viewmodel.dart";
import "package:frontend/views/OrderView/index.dart";
import "package:frontend/widgets/OrderCard.dart";
import "package:google_fonts/google_fonts.dart";
import "package:provider/provider.dart";

class HomeView extends StatelessWidget {
  const HomeView({super.key});

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
                    bodyText(
                      "",
                    bodySize: 16.0,
                    bodyColor: Colors.white),
                    const Spacer(),
                    Container(
                      margin: const EdgeInsets.only(right: 8),
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle
                      ),
                      child: Icon(
                        FeatherIcons.moon,
                        color: Theme.of(context).colorScheme.secondary,
                        size: 20.0,
                        weight: 5.0,
                      )
                    ),

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
                      height: 165,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 246, 236, 226),
                        borderRadius: BorderRadius.circular(10.0)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            titleText(
                              "Check Your Package",
                              titleSize: 24.0,
                              titleWeight: FontWeight.bold,
                            ),
                            const SizedBox(height: 4),
                            bodyText(
                              "Enter the name of the package you want to view",
                              bodySize: 12.0,
                              bodyColor: Colors.grey[700],
                              bodyAlignment: TextAlign.center,
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10.0),
                              child: TextField(
                                style: GoogleFonts.poppins(fontSize : 14.0),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                    borderSide: BorderSide.none
                                  ),
                                    hintStyle: GoogleFonts.poppins(
                                      fontSize : 14.0,
                                    ),
                                    hintText: 'Enter the package name',
                                    filled: true,
                                    fillColor: Colors.white,
                                    suffixIcon: Container(
                                      margin: const EdgeInsets.all(6.0),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Theme.of(context).colorScheme.secondary
                                      ),
                                      child: const Icon(
                                        FeatherIcons.search,
                                        color: Colors.white,
                                        size: 18.0
                                      ),
                                    )
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ),
                    const SizedBox(height: 10.0),
                    StreamBuilder(
                      stream: db.getOrdersOnToday(), 
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text('Error: ${snapshot.error}'),
                        );
                      } else if (!snapshot.hasData || snapshot.data == null) {
                        return const Center(
                          child: Text('No data available'),
                        );
                      }
                      
                       List<Map<String, dynamic>> orders = snapshot.data!.cast<Map<String, dynamic>>();

                       return SizedBox(
                        height: 80,
                         child: ListView.builder(
                          itemCount: 1,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index){
                            final order = orders[index];
                         
                            final packageName = order['name'] as String;
                            final status = order['status'] as String;
                            final deliveryDate = order['deliveryDate'] as String;
                         
                            return Container(
                              width: MediaQuery.of(context).size.width - 40,
                              child: OrderCard(
                                packageName: packageName, 
                                status: status,
                                deliveryDate: deliveryDate,
                                orderCardOpenContents: () => {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => OrderView(
                                        orderData: order, index: index)
                                    )
                                  )
                                },
                              ),
                            );
                          }),
                       );
                      }
                    )
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