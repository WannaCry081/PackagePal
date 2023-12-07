import "package:flutter/material.dart";
import "package:frontend/core/constants/text_theme.dart";
import "package:frontend/views/OrderView/index.dart";
import "package:frontend/widgets/OrderCard.dart";
import "package:google_fonts/google_fonts.dart";

class OrdersListView extends StatelessWidget {
  const OrdersListView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 16.0),
              child: titleText(
                "Orders List",
                titleSize: 22.0,
                titleWeight: FontWeight.w700
              ),
            ),
            TabBar(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              unselectedLabelColor: Colors.grey[400],
              labelStyle: GoogleFonts.poppins(
                fontSize: 16.0,
                fontWeight: FontWeight.w600
              ),
              unselectedLabelStyle: GoogleFonts.poppins(
                fontWeight: FontWeight.w400
              ),
              tabs: const [
                Tab(
                 text: "To Receive"
                ),
                Tab(
                  text: "Received"
                ),
              ]
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Builder(
                    builder: (context) => ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical:4.0, horizontal: 16.0),
                          child: OrderCard(
                            status: "On Process",
                            orderCardOpenContents: () => {
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => const OrderView())
                              )
                            },
                          ),
                        );
                      },
                    )
                  ),
                  Builder(
                    builder: (context) => ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical:4.0, horizontal: 16.0),
                          child: OrderCard(
                            status: "Completed",
                            orderCardOpenContents: () => {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const OrderView()
                                )
                              )
                            },
                          ),
                        );
                      },
                    )
                  ),
                ]
              ),
            )
          ]
        )
      ),
    );
  }
  
}