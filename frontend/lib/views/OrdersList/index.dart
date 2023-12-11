import "package:flutter/material.dart";
import "package:frontend/core/constants/text_theme.dart";
import "package:frontend/viewmodels/database_viewmodel.dart";
import "package:frontend/views/OrderView/index.dart";
import "package:frontend/widgets/OrderCard.dart";
import "package:google_fonts/google_fonts.dart";

class OrdersListView extends StatefulWidget {
  const OrdersListView({super.key});

  @override
  State<OrdersListView> createState() => _OrdersListViewState();
}

class _OrdersListViewState extends State<OrdersListView> {

  final db = DatabaseViewModel();
  List<dynamic> orders= [];
  
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


            StreamBuilder<Object>(
              stream: db.getOrders(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: Container(
                      height: 50,
                      width: 50,
                      child: const CircularProgressIndicator(),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(child: bodyText('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data == null) {
                  return Center(child: bodyText('No data available'));
                }

                
                List<dynamic> orders = snapshot.data as List<dynamic>;
              
                List<Map<String, dynamic>> onProcessOrders = orders.cast<Map<String, dynamic>>().toList();
                List<Map<String, dynamic>> completedOrders = orders.cast<Map<String, dynamic>>().toList();

                onProcessOrders = onProcessOrders
                    .where((order) => order['status'] == 'On Process')
                    .toList();
                completedOrders = completedOrders
                    .where((order) => order['status'] == 'Completed')
                    .toList();
                

                return Expanded(
                  child: TabBarView(
                    children: [
                      Builder(
                        builder: (context) => ListView.builder(
                          itemCount: onProcessOrders.length,
                          itemBuilder: (context, index) {
                            final order = onProcessOrders[index];

                            final packageName = order['name'] as String;
                            final status = order['status'] as String;
                            final deliveryDate = order['deliveryDate'] as String;

                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
                              child: OrderCard(
                                packageName: packageName,
                                status: status,
                                deliveryDate: deliveryDate,
                                orderCardOpenContents: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) => OrderView(orderData: order, index: index)),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ),
                      Builder(
                        builder: (context) => ListView.builder(
                          itemCount: completedOrders.length,
                          itemBuilder: (context, index) {
                            final order = completedOrders[index];

                            final packageName = order['name'] as String;
                            final status = order['status'] as String;
                            final deliveryDate = order['deliveryDate'] as String;

                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
                              child: OrderCard(
                                packageName: packageName,
                                status: status,
                                deliveryDate: deliveryDate,
                                orderCardOpenContents: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) => OrderView(orderData: order, index: index)),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            )

          ]
        )
      ),
    );
  }
}