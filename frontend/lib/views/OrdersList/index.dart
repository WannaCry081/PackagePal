import "package:firebase_database/firebase_database.dart";
import "package:flutter/material.dart";
import "package:frontend/core/constants/text_theme.dart";
import "package:frontend/core/providers/user_provider.dart";
import "package:frontend/models/order_model.dart";
import "package:frontend/viewmodels/database_viewmodel.dart";
import "package:frontend/views/OrderView/index.dart";
import "package:frontend/widgets/OrderCard.dart";
import "package:google_fonts/google_fonts.dart";
import "package:provider/provider.dart";

class OrdersListView extends StatefulWidget {
  const OrdersListView({super.key});

  @override
  State<OrdersListView> createState() => _OrdersListViewState();
}

class _OrdersListViewState extends State<OrdersListView> {

  final db = DatabaseViewModel();
  final realtimeDb = RealtimeDatabaseViewModel();

  List<dynamic> orders= [];

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final data = userProvider.getUserData();

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: DefaultTabController(
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
      
      
              StreamBuilder<List<OrderModel>>(
                stream: realtimeDb.fetchOrders(data?['uid']).asStream(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(child: bodyText('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data == null) {
                    return Center(child: bodyText('No data available'));
                  }
      
                  
                  List<OrderModel> orders = snapshot.data as List<OrderModel>;
                
                  List<OrderModel> onProcessOrders =
                      orders.where((order) => order.status == 'On Process').toList();
                  List<OrderModel> completedOrders =
                      orders.where((order) => order.status == 'Completed').toList();
                  
                  return Expanded(
                    child: TabBarView(
                      children: [
                        Builder(
                          builder: (context) => ListView.builder(
                            itemCount: onProcessOrders.length,
                            itemBuilder: (context, index) {
                              final order = onProcessOrders[index];

                              final orderId = order.id.toString();
                              final packageName = order.name.toString();
                              final status = order.status.toString();
                              final deliveryDate = order.deliveryDate.toString();
      
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
                                child: OrderCard(
                                  packageName: packageName,
                                  status: status,
                                  deliveryDate: deliveryDate,
                                  orderCardOpenContents: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) => 
                                        OrderView(orderData: order, orderId: orderId)),
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
      
                              final orderId = order.id.toString();
                              final packageName = order.name.toString();
                              final status = order.status.toString();
                              final deliveryDate = order.deliveryDate.toString();
      
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
                                child: OrderCard(
                                  packageName: packageName,
                                  status: status,
                                  deliveryDate: deliveryDate,
                                  orderCardOpenContents: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) => OrderView(orderData: order, orderId: orderId)),
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
      ),
    );
  }
}